#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>
#include <mpfr.h>
#include <sys/time.h>

int fd;
long
perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
               int cpu, int group_fd, unsigned long flags)
{
   int ret;

   ret = syscall(__NR_perf_event_open, hw_event, pid, cpu,
                  group_fd, flags);
   return ret;
}

void start_counter(){
   struct perf_event_attr pe;

   memset(&pe, 0, sizeof(struct perf_event_attr));
   pe.type = PERF_TYPE_HARDWARE;
   pe.size = sizeof(struct perf_event_attr);
   pe.config = PERF_COUNT_HW_INSTRUCTIONS;
//	pe.config = PERF_COUNT_HW_CPU_CYCLES;
   pe.disabled = 1;
   pe.exclude_kernel = 1;
   pe.exclude_hv = 1;

   fd = perf_event_open(&pe, 0, -1, -1, 0);
   if (fd == -1) {
      fprintf(stderr, "Error opening leader %llx\n", pe.config);
      exit(EXIT_FAILURE);
   }

   ioctl(fd, PERF_EVENT_IOC_RESET, 0);
   ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
}

void stop(){
   long long count;
   ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
   read(fd, &count, sizeof(long long));

   printf("Used %lld instructions\n", count);

}

int
main(int argc, char **argv)
{
	double xx, yy, zz;
	xx = 2.3;
	yy = 4.5;
  mpfr_t x, y, z, c;
  mpfr_init_set_d(x, 2.3, MPFR_RNDN);
  mpfr_init_set_d(y, 3.4, MPFR_RNDN);
  mpfr_init_set_d(c, 2, MPFR_RNDN);
  mpfr_init(z);
  
  printf("mpfr mul instructions\n");
	struct timeval  tv1, tv2;
  gettimeofday(&tv1, NULL);

	start_counter();
  mpfr_add(z, x, y, MPFR_RNDN);
	stop();
	gettimeofday(&tv2, NULL);

printf ("Total time = %f seconds\n",
         (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
         (double) (tv2.tv_sec - tv1.tv_sec));
/*
  printf("float addition instructions\n");
	start_counter();
	zz = xx + yy;
	stop();
  printf("float sub instructions\n");
	start_counter();
	zz = xx - yy;
	stop();
  printf("float mul instructions\n");
	start_counter();
	zz = xx * yy;
	stop();
  printf("float div instructions\n");
	start_counter();
	zz = xx / yy;
	stop();
	mpfr_set_default_prec(1000);
  mpfr_t x, y, z, c;
  mpfr_init_set_d(x, 2.3, MPFR_RNDN);
  mpfr_init_set_d(y, 3.4, MPFR_RNDN);
  mpfr_init_set_d(c, 2, MPFR_RNDN);
  mpfr_init(z);
  
  printf("mpfr mul instructions\n");
	start_counter();
  mpfr_mul(y, x, y, MPFR_RNDN);
	stop();
  printf("mpfr div instructions\n");
	start_counter();
  mpfr_div(z, z, c, MPFR_RNDN);
	stop();
  printf("mpfr addition instructions\n");
	start_counter();
  mpfr_add(z, x, y, MPFR_RNDN);
	stop();
  printf("mpfr sub instructions\n");
	start_counter();
  mpfr_sub(z, x, y, MPFR_RNDN);
	stop();
  mpfr_add(z, z, y, MPFR_RNDN);
*/
   close(fd);
}
