import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure HopfBifurcationPackage where
  vectorField : Type
  equilibrium : Type
  parameterSpace : Type
  crossingCondition : Prop
  nonresonanceCondition : Prop
  limitCycleExists : Prop
  hopfTheoremApplies : crossingCondition ∧ nonresonanceCondition → limitCycleExists

structure HopfBifurcationEvidence (P : HopfBifurcationPackage) where
  crossingConditionClosed : P.crossingCondition
  nonresonanceConditionClosed : P.nonresonanceCondition
  limitCycleExistsClosed : P.limitCycleExists
  hopfTheoremAppliesClosed : P.hopfTheoremApplies

def HopfBifurcationClosed (P : HopfBifurcationPackage) : Prop :=
  P.crossingCondition ∧ P.nonresonanceCondition ∧ P.limitCycleExists ∧ P.hopfTheoremApplies

theorem hopf_bifurcation_closed_from_evidence (P : HopfBifurcationPackage) (E : HopfBifurcationEvidence P) : HopfBifurcationClosed P := by
  exact And.intro E.crossingConditionClosed (And.intro E.nonresonanceConditionClosed (And.intro E.limitCycleExistsClosed E.hopfTheoremAppliesClosed))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
