import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure NonlinearOperatorPackage where
  domain : Type u
  codomain : Type v
  operator : domain → codomain
  smoothness : Prop
  ellipticity : Prop
  boundaryConditions : Prop

structure NonlinearOperatorEvidence (P : NonlinearOperatorPackage) where
  smoothnessClosed : P.smoothness
  ellipticityClosed : P.ellipticity
  boundaryConditionsClosed : P.boundaryConditions

def NonlinearOperatorClosed (P : NonlinearOperatorPackage) : Prop :=
  P.smoothness ∧ P.ellipticity ∧ P.boundaryConditions

theorem nonlinear_operator_closed_from_evidence (P : NonlinearOperatorPackage) (E : NonlinearOperatorEvidence P) :
    NonlinearOperatorClosed P := by
  exact And.intro E.smoothnessClosed (And.intro E.ellipticityClosed E.boundaryConditionsClosed)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse