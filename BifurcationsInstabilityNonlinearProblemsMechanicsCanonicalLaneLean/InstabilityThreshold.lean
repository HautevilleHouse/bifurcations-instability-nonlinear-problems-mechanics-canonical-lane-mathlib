import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.LyapunovSchmidtReduction

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure InstabilityThresholdPackage {B : BucklingLoadPackage}
    {H : HopfBifurcationPackage B} {L : LyapunovSchmidtReductionPackage H} where
  criticalParameterValue : Prop
  stabilityCriterion : Prop
  thresholdCrossedInducesInstability : Prop
  nonlinearAmplification : Prop

structure InstabilityThresholdEvidence {B : BucklingLoadPackage}
    {H : HopfBifurcationPackage B} {L : LyapunovSchmidtReductionPackage H}
    (I : InstabilityThresholdPackage L) where
  criticalParameterValueClosed : I.criticalParameterValue
  stabilityCriterionClosed : I.stabilityCriterion
  thresholdCrossedInducesInstabilityClosed : I.thresholdCrossedInducesInstability
  nonlinearAmplificationClosed : I.nonlinearAmplification

def InstabilityThresholdClosed {B : BucklingLoadPackage}
    {H : HopfBifurcationPackage B} {L : LyapunovSchmidtReductionPackage H}
    (I : InstabilityThresholdPackage L) : Prop :=
  I.criticalParameterValue ∧ I.stabilityCriterion ∧
  I.thresholdCrossedInducesInstability ∧ I.nonlinearAmplification

theorem instability_threshold_closed_from_evidence
    {B : BucklingLoadPackage} {H : HopfBifurcationPackage B}
    {L : LyapunovSchmidtReductionPackage H}
    (I : InstabilityThresholdPackage L)
    (E : InstabilityThresholdEvidence I) :
    InstabilityThresholdClosed I := by
  exact And.intro E.criticalParameterValueClosed
    (And.intro E.stabilityCriterionClosed
      (And.intro E.thresholdCrossedInducesInstabilityClosed E.nonlinearAmplificationClosed))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse