import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure BifurcationParameterPackage where
  parameterSpace : Type u
  criticalValue : parameterSpace
  bifurcationCondition : parameterSpace → Prop
  smoothDependence : Prop
  transversalityCondition : Prop

structure BifurcationParameterEvidence (P : BifurcationParameterPackage) where
  criticalValueTerm : P.criticalValue = P.criticalValue
  bifurcationConditionTerm : P.bifurcationCondition P.criticalValue
  smoothDependenceTerm : P.smoothDependence
  transversalityConditionTerm : P.transversalityCondition

def BifurcationParameterClosed (P : BifurcationParameterPackage) : Prop :=
  (P.bifurcationCondition P.criticalValue) ∧ P.smoothDependence ∧ P.transversalityCondition

theorem bifurcation_parameter_closed_from_evidence (P : BifurcationParameterPackage)
    (E : BifurcationParameterEvidence P) : BifurcationParameterClosed P := by
  exact And.intro E.bifurcationConditionTerm (And.intro E.smoothDependenceTerm E.transversalityConditionTerm)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse