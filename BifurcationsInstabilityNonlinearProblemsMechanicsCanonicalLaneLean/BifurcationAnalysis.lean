import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure BifurcationParameter (α : Type) where
  parameterSpace : Type u
  criticalValue : α
  bifurcationCondition : Prop

structure BifurcationBranch (α : Type) where
  branchParameter : α → Prop
  equilibriumPath : Type v
  stabilityProperty : Prop

structure BifurcationAnalysisPackage (α : Type) where
  parameter : BifurcationParameter α
  branches : List (BifurcationBranch α)
  branchingCondition : Prop

structure BifurcationAnalysisEvidence {α : Type} (P : BifurcationAnalysisPackage α) where
  parameterCriticalClosed : P.parameter.bifurcationCondition
  branchingConditionClosed : P.branchingCondition
  branchesParametersClosed : ∀ (b : BifurcationBranch α), b ∈ P.branches → b.branchParameter (P.parameter.criticalValue)

def BifurcationAnalysisClosed {α : Type} (P : BifurcationAnalysisPackage α) : Prop :=
  P.parameter.bifurcationCondition ∧ P.branchingCondition ∧
  (∀ (b : BifurcationBranch α), b ∈ P.branches → b.branchParameter (P.parameter.criticalValue))

theorem bifurcation_analysis_closed_from_evidence {α : Type} (P : BifurcationAnalysisPackage α) (E : BifurcationAnalysisEvidence P) :
  BifurcationAnalysisClosed P := by
  exact And.intro E.parameterCriticalClosed (And.intro E.branchingConditionClosed E.branchesParametersClosed)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse