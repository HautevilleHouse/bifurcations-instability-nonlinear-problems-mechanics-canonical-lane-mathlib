import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure StabilityAnalysisPackage where
  linearizedOperator : Type u
  eigenvalueSpectrum : Type v
  spectralGap : Prop
  neutralStabilityCondition : Prop
  resonancesExcluded : Prop

structure StabilityAnalysisEvidence (S : StabilityAnalysisPackage) where
  spectralGapTerm : S.spectralGap
  neutralStabilityConditionTerm : S.neutralStabilityCondition
  resonancesExcludedTerm : S.resonancesExcluded

def StabilityAnalysisClosed (S : StabilityAnalysisPackage) : Prop :=
  S.spectralGap ∧ S.neutralStabilityCondition ∧ S.resonancesExcluded

theorem stability_analysis_closed_from_evidence (S : StabilityAnalysisPackage)
    (E : StabilityAnalysisEvidence S) : StabilityAnalysisClosed S := by
  exact And.intro E.spectralGapTerm (And.intro E.neutralStabilityConditionTerm E.resonancesExcludedTerm)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse