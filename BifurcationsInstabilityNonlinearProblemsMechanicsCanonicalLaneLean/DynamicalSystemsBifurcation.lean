import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure DynamicalSystemsBifurcationPackage where
  phaseSpace : Type u
  bifurcationType : Type v
  normalForm : Prop
  centerManifoldReduction : Prop
  genericityConditions : Prop

structure DynamicalSystemsBifurcationEvidence (D : DynamicalSystemsBifurcationPackage) where
  normalFormTerm : D.normalForm
  centerManifoldReductionTerm : D.centerManifoldReduction
  genericityConditionsTerm : D.genericityConditions

def DynamicalSystemsBifurcationClosed (D : DynamicalSystemsBifurcationPackage) : Prop :=
  D.normalForm ∧ D.centerManifoldReduction ∧ D.genericityConditions

theorem dynamical_systems_bifurcation_closed_from_evidence (D : DynamicalSystemsBifurcationPackage)
    (E : DynamicalSystemsBifurcationEvidence D) : DynamicalSystemsBifurcationClosed D := by
  exact And.intro E.normalFormTerm (And.intro E.centerManifoldReductionTerm E.genericityConditionsTerm)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse