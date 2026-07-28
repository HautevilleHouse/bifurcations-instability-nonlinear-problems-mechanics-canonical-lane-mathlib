import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure BucklingLoadPackage where
  criticalLoadExists : Prop
  eulerFormulaValid : Prop
  bifurcationBranchDetected : Prop
  stabilityTransition : Prop

structure BucklingLoadEvidence (B : BucklingLoadPackage) where
  criticalLoadExistsClosed : B.criticalLoadExists
  eulerFormulaValidClosed : B.eulerFormulaValid
  bifurcationBranchDetectedClosed : B.bifurcationBranchDetected
  stabilityTransitionClosed : B.stabilityTransition

def BucklingLoadClosed (B : BucklingLoadPackage) : Prop :=
  B.criticalLoadExists ∧ B.eulerFormulaValid ∧
  B.bifurcationBranchDetected ∧ B.stabilityTransition

theorem buckling_load_closed_from_evidence (B : BucklingLoadPackage)
    (E : BucklingLoadEvidence B) : BucklingLoadClosed B := by
  exact And.intro E.criticalLoadExistsClosed
    (And.intro E.eulerFormulaValidClosed
      (And.intro E.bifurcationBranchDetectedClosed E.stabilityTransitionClosed))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse