#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <asm/unistd.h>
#include <linux/perf_event.h>
#define SIZE 10000000

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
  // pe.config = PERF_COUNT_HW_INSTRUCTIONS;
  pe.config = PERF_COUNT_HW_CPU_CYCLES;
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
	 close(fd);
   printf("Used %lld cycles\n", count);
}
