/*
	Two-dimensional FFT benchmark
	Designed and implemented by John Walker in April of 1989.
	This  benchmark executes a specified number of passes (default
	20) through a loop in which each  iteration  performs  a  fast
	Fourier transform of a square matrix (default size 256x256) of
	complex numbers (default precision double),  followed  by  the
	inverse  transform.   After  all loop iterations are performed
	the results are checked against known correct values.
	This benchmark is intended for use on C implementations  which
        define  "int"  as  32 bits or longer and permit allocation and
	direct addressing of arrays larger than one megabyte.
	If CAPOUT is defined,  the  result  after  all	iterations  is
	written  as  a	CA  Lab  pattern  file.   This is intended for
	debugging in case horribly wrong results  are  obtained  on  a
	given machine.
	Archival  timings  are	run  with the definitions below set as
	follows: Float = double, Asize = 256, Passes = 20, CAPOUT  not
	defined.
	Time (seconds)		    System
            2393.93       Sun 3/260, SunOS 3.4, C, "-f68881 -O".
			  (John Walker).
            1928          Macintosh IIx, MPW C 3.0, "-mc68020
                          -mc68881 -elems881 -m".  (Hugh Hoover).
            1636.1        Sun 4/110, "cc -O3 -lm".  (Michael McClary).
			  The suspicion is that this is software
			  floating point.
            1556.7        Macintosh II, A/UX, "cc -O -lm"
			  (Michael McClary).
	    1388.8	  Sun 386i/250, SunOS 4.0.1 C
                          "-O /usr/lib/trig.il".  (James Carrington).
	    1331.93	  Sun 3/60, SunOS 4.0.1, C,
                          "-O4 -f68881 /usr/lib/libm.il"
			  (Bob Elman).
            1204.0        Apollo Domain DN4000, C, "-cpu 3000 -opt 4".
			  (Sam Crupi).
	    1174.66	  Compaq 386/25, SCO Xenix 386 C.
			  (Peter Shieh).
	    1068	  Compaq 386/25, SCO Xenix 386,
			  Metaware High C.  (Robert Wenig).
	    1064.0	  Sun 3/80, SunOS 4.0.3 Beta C
                          "-O3 -f68881 /usr/lib/libm.il".  (James Carrington).
	    1061.4	  Compaq 386/25, SCO Xenix, High C 1.4.
			  (James Carrington).
	    1059.79	  Compaq 386/25, 387/25, High C 1.4,
			  DOS|Extender 2.2, 387 inline code
			  generation.  (Nathan Bender).
	     777.14	  Compaq 386/25, IIT 3C87-25 (387 Compatible),
			  High C 1.5, DOS|Extender 2.2, 387 inline
			  code generation.  (Nathan Bender).
	     751	  Compaq DeskPro 386/33, High C 1.5 + DOS|Extender,
			  387 code generation.	(James Carrington).
	     431.44	  Compaq 386/25, Weitek 3167-25, DOS 3.31,
			  High C 1.4, DOS|Extender, Weitek code generation.
			  (Nathan Bender).
	     344.9	  Compaq 486/25, Metaware High C 1.6, Phar Lap
			  DOS|Extender, in-line floating point.  (Nathan
			  Bender).
	     324.2	  Data General Motorola 88000, 16 Mhz, Gnu C.
             323.1        Sun 4/280, C, "-O4".  (Eric Hill).
	     254	  Compaq SystemPro 486/33, High C 1.5 + DOS|Extender,
			  387 code generation.	(James Carrington).
	     242.8	  Silicon Graphics Personal IRIS, MIPS R2000A,
                          12.5 Mhz, "-O3" (highest level optimisation).
			  (Mike Zentner).
             233.0        Sun SPARCStation 1, C, "-O4", SunOS 4.0.3.
			  (Nathan Bender).
	     187.30	  DEC PMAX 3100, MIPS 2000 chip.
			  (Robert Wenig).
             120.46       Sun SparcStation 2, C, "-O4", SunOS 4.1.1.
			  (John Walker).
             120.21       DEC 3MAX, MIPS 3000, "-O4".
	      98.0	  Intel i860 experimental environment,
			  OS/2, data caching disabled.	(Kern
			  Sibbald).
	      34.9	  Silicon Graphics Indigo², MIPS R4400,
                          175 Mhz, IRIX 5.2, "-O".
	      32.4	  Pentium 133, Windows NT, Microsoft Visual
			  C++ 4.0.
	      17.25	  Silicon Graphics Indigo², MIPS R4400,
                          175 Mhz, IRIX 6.5, "-O3".
	      14.10	  Dell Dimension XPS R100, Pentium II 400 MHz,
			  Windows 98, Microsoft Visual C 5.0.
	      10.7	  Hewlett-Packard Kayak XU 450Mhz Pentium II,
			  Microsoft Visual C++ 6.0, Windows NT 4.0sp3.	(Nathan Bender).
	       5.09	  Sun Ultra 2, UltraSPARC V9, 300 MHz, gcc -O3.
	       
	       0.846	  Dell Inspiron 9100, Pentium 4, 3.4 GHz, gcc -O3.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


#define Float	 double 	   /* Floating point type used in FFT */

//#define Asize	 256		   /* Array edge size */
#define Asize	 8		   /* Array edge size */
#define Passes	 1		   /* Number of FFT/Inverse passes */

int main()
{
	int i, j, k, l, m, npasses = Passes, faedge;
	Float *fdata;
	static int nsize[] = {0, 0, 0};
	long fanum, fasize;
	double mapbase, mapscale, rmin, rmax, imin, imax;

	faedge = Asize; 	   /* FFT array edge size */
	fanum = faedge * faedge;   /* Elements in FFT array */
	fasize = ((fanum + 1) * 2 * sizeof(Float)); /* FFT array size */
	nsize[1] = nsize[2] = faedge;

	fdata = (Float *) malloc(fasize);
	if (fdata == NULL) {
           fprintf(stderr, "Can't allocate data array.\n");
	   exit(1);
	}

	memset(fdata, 0, fasize);

	   double r, ij, ar, ai;
	   rmin = 1e10; rmax = -1e10;
	   imin = 1e10; imax = -1e10;
	   ar = 0;
	   ai = 0;

	   for (i = 1; i <= fanum; i += 2) {
	      r = fdata[i];
				printf("%e:", r);
	      ij = fdata[i + 1];
	   }

	return 0;
}
