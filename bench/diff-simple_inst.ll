; ModuleID = 'diff-simple_inst.bc'
source_filename = "diff-simple.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @sum(double %x) local_unnamed_addr #0 {
entry:
  %0 = bitcast double (double)* @sum to i8*
  call void @funcInit(i8* %0)
  %1 = bitcast i8* null to i8*
  %2 = bitcast i8* null to i8*
  %3 = bitcast i8* null to i8*
  %4 = bitcast i8* null to i8*
  %add = fadd double %x, 1.000000e+00
  %5 = call i8* @computeReal(i32 12, i64 0, i8* %2, i64 0, i8* %3, double %x, double 1.000000e+00, double %add, i32 2)
  %6 = bitcast i8* null to i8*
  %7 = bitcast i8* %5 to i8*
  %8 = bitcast i8* null to i8*
  %9 = bitcast i8* null to i8*
  %10 = bitcast i8* null to i8*
  %sub = fsub double %add, %x
  %11 = call i8* @computeReal(i32 14, i64 0, i8* %7, i64 0, i8* %9, double %add, double %x, double %sub, i32 3)
  %12 = bitcast double (double)* @sum to i8*
  call void @funcExit(i8* %12)
  %13 = bitcast i8* %11 to i8*
  call void @trackReturn(i8* %13)
  call void @cleanComputeReal(i32 2)
  ret double %sub
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %0 = bitcast i32 ()* @main to i8*
  call void @funcInit(i8* %0)
  %1 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %1)
  call void @finish()
  ret i32 0
}

declare void @funcInit(i8*)

declare void @funcExit(i8*)

declare i8* @computeReal(i32, i64, i8*, i64, i8*, double, double, double, i32)

declare void @trackReturn(i8*)

declare void @cleanComputeReal(i32)

declare void @finish()

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
