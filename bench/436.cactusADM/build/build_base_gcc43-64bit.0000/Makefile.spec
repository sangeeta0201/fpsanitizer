TUNE=base
EXT=gcc43-64bit
NUMBER=436
NAME=cactusADM
SOURCES= PreLoop.F StaggeredLeapfrog1a.F StaggeredLeapfrog1a_TS.F \
	 StaggeredLeapfrog2.F planewaves.F teukwaves.F datestamp.c regex.c \
	 PUGH/GHExtension.c PUGH/FinishReceiveGA.c PUGH/Startup.c PUGH/Evolve.c \
	 PUGH/Storage.c PUGH/SetupGroup.c PUGH/PostSendGA.c PUGH/SetupPGH.c \
	 PUGH/SetupPGV.c PUGH/LoadAware.c PUGH/Comm.c PUGH/cctk_ThornBindings.c \
	 PUGH/Overloadables.c PUGH/PughUtils.c PUGH/PostReceiveGA.c \
	 Time/Courant.c Time/Initialise.c Time/cctk_ThornBindings.c Time/Given.c \
	 Time/Simple.c Cactus/ScheduleTraverse.c Cactus/Groups.c Cactus/Dummies.c \
	 Cactus/File.c Cactus/CactusDefaultEvolve.c Cactus/BinaryTree.c \
	 Cactus/Hash.c Cactus/Malloc.c Cactus/CactusTimers.c \
	 Cactus/CallStartupFunctions.c Cactus/FortranBindingsIO.c \
	 Cactus/ConfigData.c Cactus/CactusDefaultMainLoopIndex.c Cactus/Misc.c \
	 Cactus/CactusDefaultComm.c Cactus/Cache.c Cactus/RegisterKeyedFunction.c \
	 Cactus/Subsystems.c Cactus/FortranWrappers.c Cactus/Network.c \
	 Cactus/Stagger.c Cactus/CactusDefaultInitialise.c Cactus/Time.c \
	 Cactus/Expression.c Cactus/CactusSync.c Cactus/ProcessCommandLine.c \
	 Cactus/WarnLevel.c Cactus/CommandLine.c Cactus/Coord.c \
	 Cactus/ScheduleInterface.c Cactus/MainUtils.c Cactus/Reduction.c \
	 Cactus/GHExtensions.c Cactus/StoreHandledData.c Cactus/ShutdownCactus.c \
	 Cactus/ProcessEnvironment.c Cactus/getopt.c Cactus/ParseFile.c \
	 Cactus/OverloadIO.c Cactus/StoreKeyedData.c Cactus/getopt1.c \
	 Cactus/CactusDefaultShutdown.c Cactus/Banner.c Cactus/Termination.c \
	 Cactus/ProcessParameterDatabase.c Cactus/ActiveThorns.c Cactus/String.c \
	 Cactus/SetupCache.c Cactus/Table.c Cactus/DebugDefines.c Cactus/Interp.c \
	 Cactus/Parameters.c Cactus/GroupsOnGH.c Cactus/InitialiseCactus.c \
	 Cactus/IOMethods.c Cactus/flesh.c Cactus/ScheduleCreater.c \
	 Cactus/SetParams.c Cactus/cctk_ThornBindings.c Cactus/OverloadComm.c \
	 Cactus/Names.c Cactus/InitialiseDataStructures.c Cactus/StringList.c \
	 Cactus/DefaultTimers.c Cactus/StoreNamedData.c Cactus/ScheduleSorter.c \
	 Cactus/Complex.c Cactus/OverloadMain.c Cactus/Traverse.c \
	 Cactus/SKBinTree.c Cactus/snprintf.c IOUtil/CheckpointRecovery.c \
	 IOUtil/Utils.c IOUtil/AdvertisedFiles.c IOUtil/Startup.c \
	 IOUtil/cctk_ThornBindings.c IDLinearWaves/cctk_ThornBindings.c \
	 BenchADMsrc/Startup.c BenchADMsrc/ParamCheck.c \
	 BenchADMsrc/cctk_ThornBindings.c \
	 CactusBindings/ParameterRecoveryEinstein.c \
	 CactusBindings/ParameterRecoveryCactus.c CactusBindings/TIME_private.c \
	 CactusBindings/OverloadThorns.c CactusBindings/Cactus.c \
	 CactusBindings/PUGH_Register.c CactusBindings/EINSTEIN_restricted.c \
	 CactusBindings/ParameterRecoveryIOASCII.c CactusBindings/IOASCII.c \
	 CactusBindings/CreateTimeParameters.c \
	 CactusBindings/BOUNDARY_restricted.c \
	 CactusBindings/CreateIOBasicParameters.c CactusBindings/Global.c \
	 CactusBindings/ParameterRecoveryPUGH.c CactusBindings/EINSTEIN_private.c \
	 CactusBindings/CARTGRID3D_private.c \
	 CactusBindings/BindingsParameterRecovery.c CactusBindings/PUGH.c \
	 CactusBindings/ParameterRecoveryPUGHSlab.c CactusBindings/SchedulePUGH.c \
	 CactusBindings/IOUtil_Register.c CactusBindings/TIME_restricted.c \
	 CactusBindings/Cactus_FortranWrapper.c \
	 CactusBindings/ParameterRecoveryTime.c \
	 CactusBindings/BenchADM_FortranWrapper.c \
	 CactusBindings/IOASCII_private.c CactusBindings/PUGHReduce.c \
	 CactusBindings/CACTUS_private.c CactusBindings/Time.c \
	 CactusBindings/ScheduleTime.c CactusBindings/Boundary_Register.c \
	 CactusBindings/PUGHReduce_Register.c \
	 CactusBindings/CreateEinsteinParameters.c \
	 CactusBindings/BindingsSchedule.c \
	 CactusBindings/CreateIOASCIIParameters.c \
	 CactusBindings/CreatePUGHParameters.c CactusBindings/BENCHADM_private.c \
	 CactusBindings/CreateBenchADMParameters.c \
	 CactusBindings/CreateIOUtilParameters.c \
	 CactusBindings/CreateCartGrid3DParameters.c \
	 CactusBindings/IDLINEARWAVES_private.c CactusBindings/Boundary.c \
	 CactusBindings/Einstein.c CactusBindings/CreateIDLinearWavesParameters.c \
	 CactusBindings/ParameterRecoveryBenchADM.c \
	 CactusBindings/ParameterRecoveryIOBasic.c CactusBindings/PUGH_private.c \
	 CactusBindings/ScheduleIOASCII.c CactusBindings/PUGHSlab_Register.c \
	 CactusBindings/ScheduleBoundary.c \
	 CactusBindings/CreatePUGHReduceParameters.c CactusBindings/IOBasic.c \
	 CactusBindings/ScheduleEinstein.c \
	 CactusBindings/ParameterRecoveryPUGHReduce.c CactusBindings/CartGrid3D.c \
	 CactusBindings/IOASCII_Register.c \
	 CactusBindings/IDLinearWaves_FortranWrapper.c \
	 CactusBindings/PUGH_FortranWrapper.c \
	 CactusBindings/ScheduleIDLinearWaves.c \
	 CactusBindings/DummyThornFunctions.c \
	 CactusBindings/CreateBoundaryParameters.c CactusBindings/IO_restricted.c \
	 CactusBindings/PUGHSlab.c CactusBindings/BenchADM_Register.c \
	 CactusBindings/CartGrid3D_Register.c CactusBindings/SchedulePUGHSlab.c \
	 CactusBindings/ParameterRecoveryIDLinearWaves.c \
	 CactusBindings/IOBASIC_private.c CactusBindings/SchedulePUGHReduce.c \
	 CactusBindings/PUGHReduce_FortranWrapper.c \
	 CactusBindings/ScheduleIOUtil.c CactusBindings/Einstein_Register.c \
	 CactusBindings/CreateCactusParameters.c CactusBindings/Time_Register.c \
	 CactusBindings/IOBasic_FortranWrapper.c \
	 CactusBindings/CreatePUGHSlabParameters.c \
	 CactusBindings/CACTUS_restricted.c CactusBindings/BindingsVariables.c \
	 CactusBindings/IsOverloaded.c CactusBindings/Cactus_Register.c \
	 CactusBindings/Einstein_FortranWrapper.c \
	 CactusBindings/ParameterRecoveryIOUtil.c CactusBindings/IOUtil.c \
	 CactusBindings/ParameterRecoveryCartGrid3D.c \
	 CactusBindings/PUGHSlab_FortranWrapper.c \
	 CactusBindings/BENCHADM_restricted.c CactusBindings/BindingsParameters.c \
	 CactusBindings/CartGrid3D_FortranWrapper.c \
	 CactusBindings/RegisterThornFunctions.c \
	 CactusBindings/Boundary_FortranWrapper.c \
	 CactusBindings/ScheduleIOBasic.c CactusBindings/BenchADM.c \
	 CactusBindings/IOBasic_Register.c CactusBindings/IDLinearWaves.c \
	 CactusBindings/Time_FortranWrapper.c \
	 CactusBindings/IDLinearWaves_Register.c \
	 CactusBindings/IOASCII_FortranWrapper.c \
	 CactusBindings/ScheduleBenchADM.c CactusBindings/ScheduleCactus.c \
	 CactusBindings/ImplementationBindings.c \
	 CactusBindings/DRIVER_restricted.c \
	 CactusBindings/IOUtil_FortranWrapper.c \
	 CactusBindings/ScheduleCartGrid3D.c \
	 CactusBindings/FortranThornFunctions.c CactusBindings/GRID_restricted.c \
	 CactusBindings/ParameterRecoveryBoundary.c CartGrid3D/SymmetryWrappers.c \
	 CartGrid3D/GHExtension.c CartGrid3D/DecodeSymParameters.c \
	 CartGrid3D/SetSymmetry.c CartGrid3D/Startup.c CartGrid3D/CartGrid3D.c \
	 CartGrid3D/Symmetry.c CartGrid3D/ParamCheck.c \
	 CartGrid3D/cctk_ThornBindings.c Einstein/Courant.c \
	 Einstein/InitialEinstein.c Einstein/MaskInit.c Einstein/Slicing.c \
	 Einstein/InitialFlat.c Einstein/carttosphere.c Einstein/InitSymBound.c \
	 Einstein/LapseInits.c Einstein/cctk_ThornBindings.c \
	 Einstein/ShiftInits.c Einstein/evaltrK.c Einstein/ConfPhys.c \
	 PUGHReduce/ReductionNormInf.c PUGHReduce/ReductionMax.c \
	 PUGHReduce/ReductionMin.c PUGHReduce/ReductionSum.c PUGHReduce/Startup.c \
	 PUGHReduce/Reduction.c PUGHReduce/ReductionNorm1.c \
	 PUGHReduce/ReductionNorm2.c PUGHReduce/cctk_ThornBindings.c \
	 Boundary/FlatBoundary.c Boundary/ScalarBoundary.c \
	 Boundary/RadiationBoundary.c Boundary/RobinBoundary.c \
	 Boundary/CopyBoundary.c Boundary/cctk_ThornBindings.c \
	 PUGHSlab/DatatypeConversion.c PUGHSlab/GetHyperslab.c PUGHSlab/Mapping.c \
	 PUGHSlab/Hyperslab.c PUGHSlab/cctk_ThornBindings.c \
	 PUGHSlab/NewHyperslab.c IOASCII/Output1D.c IOASCII/Output2D.c \
	 IOASCII/Output3D.c IOASCII/Startup.c IOASCII/cctk_ThornBindings.c \
	 IOASCII/ChooseOutput.c IOASCII/Write1D.c IOASCII/Write2D.c \
	 IOASCII/Write3D.c IOBasic/WriteScalar.c IOBasic/OutputScalar.c \
	 IOBasic/OutputInfo.c IOBasic/Startup.c IOBasic/WriteInfo.c \
	 IOBasic/cctk_ThornBindings.c
EXEBASE=cactusADM
NEED_MATH=yes
BENCHLANG=F C
ONESTEP=
FONESTEP=

BENCH_CFLAGS     = -Iinclude -I../include -DCCODE
BENCH_CXXFLAGS   = -Iinclude -I../include -DCCODE
CC               = /usr/bin/gcc -g
COPTIMIZE        = -O2 -fno-strict-aliasing -ffast-math
CXX              = /usr/bin/g++
CXXOPTIMIZE      = -O2 -fno-strict-aliasing -ffast-math
FC               = /usr/bin/gfortran
FOPTIMIZE        = -O2 -fno-strict-aliasing
FPBASE           = yes
OS               = unix
PORTABILITY      = -DSPEC_CPU_LP64
absolutely_no_locking = 0
action           = build
allow_extension_override = 0
backup_config    = 1
baseexe          = cactusADM
basepeak         = 1
benchdir         = benchspec
benchmark        = 436.cactusADM
binary           = 
bindir           = exe
build_in_build_dir = 1
builddir         = build
bundleaction     = 
bundlename       = 
calctol          = 0
changedmd5       = 0
check_integrity  = 1
check_md5        = 1
check_version    = 1
clean_between_builds = no
command_add_redirect = 0
commanderrfile   = speccmds.err
commandexe       = cactusADM_base.gcc43-64bit
commandfile      = speccmds.cmd
commandoutfile   = speccmds.out
commandstdoutfile = speccmds.stdout
compareerrfile   = compare.err
comparefile      = compare.cmd
compareoutfile   = compare.out
comparestdoutfile = compare.stdout
compile_error    = 0
compwhite        = 
configdir        = config
configpath       = /home/sangeeta/install_archives/config/Sangeeta-linux.cfg
copies           = 1
datadir          = data
default_size     = ref
delay            = 0
deletebinaries   = 0
deletework       = 0
dependent_workloads = 0
difflines        = 10
dirprot          = 511
endian           = 12345678
env_vars         = 0
exitvals         = spec_exit
expand_notes     = 0
expid            = 
ext              = gcc43-64bit
fake             = 0
feedback         = 1
flag_url_base    = http://www.spec.org/auto/cpu2006/flags/
floatcompare     = 1
help             = 0
http_proxy       = 
http_timeout     = 30
hw_avail         = Dec-9999
hw_cpu_char      = 
hw_cpu_mhz       = 9999
hw_cpu_name      = Intel Core i7-7700K
hw_disk          = 1.8 TB  add more disk info here
hw_fpu           = Integrated
hw_memory001     = 31.335 GB fixme: If using DDR3, format is:
hw_memory002     = 'N GB (M x N GB nRxn PCn-nnnnnR-n, ECC)'
hw_model         = System Model Name
hw_nchips        = 1
hw_ncores        = number of cores enabled
hw_ncoresperchip = number of cores manufactured into each chip
hw_ncpuorder     = 1,2 chips
hw_nthreadspercore = number of threads enabled per core
hw_ocache        = None
hw_other         = None
hw_pcache        = 9999 KB I + 9999 KB D on chip per core
hw_scache        = 9999 KB I+D on chip per core
hw_tcache        = 9999 MB I+D on chip per chip
hw_vendor        = System Vendor
ignore_errors    = yes
ignore_sigint    = 0
ignorecase       = 
info_wrap_columns = 50
inputdir         = input
iteration        = -1
iterations       = 3
keeptmp          = 0
license_num      = 0
line_width       = 0
locking          = 1
log              = CPU2006
log_line_width   = 0
log_timestamp    = 0
logname          = /home/sangeeta/install_archives/result/CPU2006.105.log
lognum           = 105
mach             = default
mail_reports     = all
mailcompress     = 0
mailmethod       = smtp
mailport         = 25
mailserver       = 127.0.0.1
mailto           = 
make             = specmake
make_no_clobber  = 0
makeflags        = 
max_active_compares = 0
mean_anyway      = 0
min_report_runs  = 3
minimize_builddirs = 0
minimize_rundirs = 0
name             = cactusADM
need_math        = yes
no_input_handler = close
no_monitor       = 
note_preenv      = 0
notes_os_000     = 'ulimit -s unlimited' was used to set environment stack size
notes_plat_sysinfo_000 =  Sysinfo program /home/sangeeta/install_archives/Docs/sysinfo
notes_plat_sysinfo_005 =  $Rev: 6775 $ $Date:: 2011-08-16 \#$ 8787f7622badcf24e01c368b1db4377c
notes_plat_sysinfo_010 =  running on prof1 Fri Aug 24 08:44:57 2018
notes_plat_sysinfo_015 = 
notes_plat_sysinfo_020 =  This section contains SUT (System Under Test) info as seen by
notes_plat_sysinfo_025 =  some common utilities.  To remove or add to this section, see:
notes_plat_sysinfo_030 =    http://www.spec.org/cpu2006/Docs/config.html\#sysinfo
notes_plat_sysinfo_035 = 
notes_plat_sysinfo_040 =  From /proc/cpuinfo
notes_plat_sysinfo_045 =     model name : Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
notes_plat_sysinfo_050 =        1 "physical id"s (chips)
notes_plat_sysinfo_055 =        4 "processors"
notes_plat_sysinfo_060 =     cores, siblings (Caution: counting these is hw and system dependent.  The
notes_plat_sysinfo_065 =     following excerpts from /proc/cpuinfo might not be reliable.  Use with
notes_plat_sysinfo_070 =     caution.)
notes_plat_sysinfo_075 =        cpu cores : 4
notes_plat_sysinfo_080 =        siblings  : 4
notes_plat_sysinfo_085 =        physical 0: cores 0 1 2 3
notes_plat_sysinfo_090 =     cache size : 8192 KB
notes_plat_sysinfo_095 = 
notes_plat_sysinfo_100 =  From /proc/meminfo
notes_plat_sysinfo_105 =     MemTotal:       32857616 kB
notes_plat_sysinfo_110 =     HugePages_Total:       0
notes_plat_sysinfo_115 =     Hugepagesize:       2048 kB
notes_plat_sysinfo_120 = 
notes_plat_sysinfo_125 =  /usr/bin/lsb_release -d
notes_plat_sysinfo_130 =     Ubuntu 16.04.3 LTS
notes_plat_sysinfo_135 = 
notes_plat_sysinfo_140 =  From /etc/*release* /etc/*version*
notes_plat_sysinfo_145 =     debian_version: stretch/sid
notes_plat_sysinfo_150 =     os-release:
notes_plat_sysinfo_155 =        NAME="Ubuntu"
notes_plat_sysinfo_160 =        VERSION="16.04.3 LTS (Xenial Xerus)"
notes_plat_sysinfo_165 =        ID=ubuntu
notes_plat_sysinfo_170 =        ID_LIKE=debian
notes_plat_sysinfo_175 =        PRETTY_NAME="Ubuntu 16.04.3 LTS"
notes_plat_sysinfo_180 =        VERSION_ID="16.04"
notes_plat_sysinfo_185 =        HOME_URL="http://www.ubuntu.com/"
notes_plat_sysinfo_190 =        SUPPORT_URL="http://help.ubuntu.com/"
notes_plat_sysinfo_195 = 
notes_plat_sysinfo_200 =  uname -a:
notes_plat_sysinfo_205 =     Linux prof1 4.4.0-133-generic \#159-Ubuntu SMP Fri Aug 10 07:31:43 UTC 2018
notes_plat_sysinfo_210 =     x86_64 x86_64 x86_64 GNU/Linux
notes_plat_sysinfo_215 = 
notes_plat_sysinfo_220 =  run-level 5 Aug 22 10:37
notes_plat_sysinfo_225 = 
notes_plat_sysinfo_230 =  SPEC is set to: /home/sangeeta/install_archives
notes_plat_sysinfo_235 =     Filesystem     Type  Size  Used Avail Use% Mounted on
notes_plat_sysinfo_240 =     /dev/sda3      ext4  1.8T  390G  1.4T  23% /
notes_plat_sysinfo_245 = 
notes_plat_sysinfo_250 =  (End of data from sysinfo program)
notes_submit_000 = 'numactl' was used to bind copies to the cores.
notes_submit_005 = See the configuration file for details.
notes_wrap_columns = 0
notes_wrap_indent =   
num              = 436
obiwan           = 
os_exe_ext       = 
output           = asc
output_format    = asc,csv,html
output_root      = 
outputdir        = output
parallel_setup   = 1
parallel_setup_prefork = 
parallel_setup_type = fork
parallel_test    = 0
parallel_test_submit = 0
parallel_test_workloads = 
path             = /home/sangeeta/install_archives/benchspec/CPU2006/436.cactusADM
plain_train      = 1
power            = 0
preenv           = 1
prefix           = 
prepared_by      = sangeeta  (is never output, only tags rawfile)
ranks            = 1
rate             = 0
realuser         = your name here
rebuild          = 0
reftime          = reftime
reportable       = yes
resultdir        = result
review           = 0
run              = all
rundir           = run
runspec          = /home/sangeeta/install_archives/bin/runspec --config=Sangeeta-linux.cfg --action=build --tune=base cactusADM
safe_eval        = 1
section_specifier_fatal = 1
sendmail         = /usr/sbin/sendmail
setpgrp_enabled  = 1
setprocgroup     = 1
setup_error      = 0
shrate           = 0
sigint           = 2
size             = ref
size_class       = ref
skipabstol       = 
skipobiwan       = 
skipreltol       = 
skiptol          = 
smarttune        = base
specdiff         = specdiff
specmake         = Makefile.YYYtArGeTYYYspec
specrun          = specinvoke
speed            = 0
srcalt           = 
srcdir           = src
srcsource        = /home/sangeeta/install_archives/benchspec/CPU2006/436.cactusADM/src
stagger          = 10
strict_rundir_verify = 1
submit_default   = $BIND $command
sw_avail         = May-2010
sw_base_ptrsize  = 64-bit
sw_compiler      = gcc, g++ & gfortran 4.3.4
sw_file          = ext4
sw_os001         = Ubuntu 16.04.3 LTS
sw_os002         = 4.4.0-133-generic
sw_other         = None
sw_peak_ptrsize  = 64-bit
sw_state         = Run level 5 (add definition here)
sysinfo_program  = specperl /home/sangeeta/install_archives/Docs/sysinfo
table            = 1
teeout           = yes
teerunout        = yes
test_date        = Aug-2018
test_sponsor     = Test Sponsor (Optional, defaults to hw_vendor)
tester           = (Optional, defaults to hw_vendor)
top              = /home/sangeeta/install_archives
train_with       = train
tune             = base
uid              = 1002
unbuffer         = 1
update-flags     = 0
use_submit_for_speed = 0
username         = sangeeta
vendor           = anon
vendor_makefiles = 0
verbose          = 5
version          = 0
version_url      = http://www.spec.org/auto/cpu2006/current_version
worklist         = list
OUTPUT_RMFILES   = benchADM.out
