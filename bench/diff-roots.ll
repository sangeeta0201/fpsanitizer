; ModuleID = 'diff-roots.bc'
source_filename = "diff-roots.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@inputs = dso_local global [100 x double] [double 0x4873986923C64567, double 0x58EC944A5CFFDC51, double 0xD7AB58BA7CCD1F29, double 0xE146A9E31EFB41F2, double 0x27F8085462C2007C, double 0x438DCDE7E9E8231B, double 0x7263F92E255A0F76, double 0x79AC4C9D79FC233, double 0xD7B7500D5D32FB66, double 0xD95A30A3E458BA31, double 0xA317B105895D6125, double 0xA8D4845E5AE9A858, double 0xE0C6D0CD8CB2BDAB, double 0x861124549EB4769B, double 0x8641F8741D82C40E, double 0xF0878DDCBD3DF521, double 0xD4A1C83EDDE91A70, double 0x2367ADFCF8E1C241, double 0x2A97C67E5F01823E, double 0x7796D36B4ADCB9EA, double 0x4E2A585CA438D78F, double 0x6FBD43B7CB042EC, double 0x8F548D3CCCAF9A32, double 0xA45C7FDB1B1889EC, double 0xBB4378FE481AF902, double 0xC33ADEAA26FA40FB, double 0x3FE6EDD1A52985FB, double 0xC794B77CC13CF005, double 0xA86115BE0FD86575, double 0x26BBAF5CE9F98C89, double 0x4095B60F3C99B6A8, double 0x50B3E4F135EB57B1, double 0xBF000BF75DEF7E05, double 0xAE5823AEAA184E9, double 0x7FD04ACB700B8FCA, double 0x96BD476402473148, double 0x9EA83F1E5D23121F, double 0xFDC5C564EE7B471C, double 0x82C53E5A7B732B14, double 0x2F63D379234BB15E, double 0x624EE64DF70813B, double 0x59DC1109709ECA11, double 0x11F2D9AC5BD4E0AA, double 0x703BA8AF21105E1B, double 0xC5500EE3E7CD7E33, double 0x15CC315D447D648, double 0x1198422016F4FBB, double 0xA5F5307D579B24BA, double 0x11CAC1A1EE1370B, double 0x70295AF8BD238F7F, double 0x7713821B34A418F8, double 0xD3E8E74E2ACA55B5, double 0xE8E09938F6321298, double 0x1A34EA3D5C4DCA79, double 0x82771B4E6E5F5DBC, double 0xFD05286C4BCBC5FA, double 0xFA2BFE21D4866AAC, double 0xAAA26A55591A91AA, double 0xE37321B5EC708DBE, double 0x29D3B75C0904173B, double 0xC9AF12B35094FF36, double 0xA9EE3E4FCF0ACE2, double 0x31498D15FF326B4F, double 0xB5A92E4EB5824AFD, double 0x1BB2AFD42C708A08, double 0x1348C6541A29858A, double 0x1DD5F6BCE80A069A, double 0xF04447A8AE18F10E, double 0xAB8EB9F35A5BFEAC, double 0xC29BB62D9DD7574C, double 0xE806F3E543429D09, double 0x82CD9DAF2233F8C4, double 0xD42D9E7F4D844EA3, double 0x6E47E77664D467AD, double 0x3DEC8C1CDE324CDE, double 0x8AF62E30D3C48C4A, double 0x856C3685E8232E20, double 0x23044807ECB285FB, double 0x28B90B0B3BEC2FF4, double 0xACC3AB86A8BA5E20, double 0x5DEC80F14A05F63E, double 0xFBB7CC336867AED9, double 0xD2E339A358504699, double 0x5A345DD967D32C14, double 0xD5F2DFA0945E4FF7, double 0xB105F8F627A88110, double 0xC1B4D9BE04016394, double 0xA2FA6E788544ACBC, double 0x7E2300E6EF69CF49, double 0x9E6979DACD1A57D0, double 0x517E714CB37E256A, double 0x6B48ABB3CF251B51, double 0xE494413A8B536384, double 0x169095993A31B2FB, double 0xEAEED8446F573E32, double 0xC3E58DE946BCF49B, double 0x8DF542088ECF3625, double 0x81532C5EBBE25BE9, double 0x8AB2D2D29DAA6F60, double 0xD054F5FA7E856CD0], align 16
@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [100 x double], [100 x double]* @inputs, i64 0, i64 %idxprom
  %2 = load double, double* %arrayidx, align 8
  %3 = call double @llvm.fabs.f64(double %2)
  store volatile double %3, double* %x, align 8
  %4 = load volatile double, double* %x, align 8
  %add = fadd double %4, 1.000000e+00
  %call = call double @sqrt(double %add) #4
  %5 = load volatile double, double* %x, align 8
  %call1 = call double @sqrt(double %5) #4
  %sub = fsub double %call, %call1
  store volatile double %sub, double* %y, align 8
  %6 = load volatile double, double* %y, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), double %6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #1

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 336308)"}
