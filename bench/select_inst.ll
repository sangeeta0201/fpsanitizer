; ModuleID = 'select_inst.bc'
source_filename = "select.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @test58(i32 %var1) local_unnamed_addr #0 {
entry:
  %0 = bitcast i32 (i32)* @test58 to i8*
  call void @funcInit(i8* %0)
  %switch.tableidx = add i32 %var1, -1
  %1 = icmp ult i32 %switch.tableidx, 5
  %spec.select = select i1 %1, i32 %var1, i32 0
  %2 = bitcast i32 (i32)* @test58 to i8*
  call void @funcExit(i8* %2)
  ret i32 %spec.select
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* null to i8*
  %1 = bitcast i32 ()* @main to i8*
  call void @funcInit(i8* %1)
  %2 = bitcast i32 ()* @main to i8*
  call void @funcExit(i8* %2)
  call void @finish()
  ret i32 0
}

declare void @funcInit(i8*)

declare void @funcExit(i8*)

declare void @finish()

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
