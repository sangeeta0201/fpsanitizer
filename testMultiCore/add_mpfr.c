#include <stdio.h>
#include <mpfr.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <linux/types.h>
#include <linux/perf_event.h>

size_t perf_fds;

int perf_event_open_wrapper(struct perf_event_attr *hw_event, pid_t pid,                                           
        int cpu, int group_fd, unsigned long flags)
{
  int ret;
  ret = syscall(__NR_perf_event_open, hw_event, pid, cpu,
        group_fd, flags);
  return ret;
}

void start_count() {
#if 1
  struct perf_event_attr pe;

  memset(&pe, 0, sizeof(struct perf_event_attr));
  pe.type = PERF_TYPE_HARDWARE;
  pe.size = sizeof(struct perf_event_attr);
  //pe.config = PERF_COUNT_HW_INSTRUCTIONS;
  pe.config = PERF_COUNT_HW_CPU_CYCLES;
  pe.disabled = 1;
  pe.exclude_kernel = 1;
  pe.exclude_hv = 1;
  pe.exclude_idle = 1;

  int fd;
  fd = perf_event_open_wrapper(&pe, 0, -1, -1, 0);
  if (fd == -1) {
    //fprintf(stderr, "Error opening leader. Error number: %d\n", errno);
    exit(0);
  }
  perf_fds = fd;

  ioctl(fd, PERF_EVENT_IOC_RESET);
  ioctl(fd, PERF_EVENT_IOC_ENABLE);
#endif
}

size_t stop_n_get_count () {
#if 1
  ioctl(perf_fds, PERF_EVENT_IOC_DISABLE);
  size_t count = 0;
  read(perf_fds, &count, sizeof(unsigned long));
  close(perf_fds);
  return count;
#else
  return 1;
#endif
}

int main(){
	//double x, y, z;
	mpfr_set_default_prec(1000);
	mpfr_t x, y, z, c;
	mpfr_init_set_d(x, 2.3, MPFR_RNDN);
	mpfr_init_set_d(y, 3.4, MPFR_RNDN);
	mpfr_init_set_d(c, 2, MPFR_RNDN);
	mpfr_init(z);
	
	start_count();
	mpfr_add(z, x, y, MPFR_RNDN);
	mpfr_mul(y, x, y, MPFR_RNDN);
	mpfr_add(z, z, y, MPFR_RNDN);
	mpfr_div(z, z, c, MPFR_RNDN);
	stop_n_get_count();
	printf("z:%e\n", z);
	printf("perf_fds:%d\n", perf_fds);
}

