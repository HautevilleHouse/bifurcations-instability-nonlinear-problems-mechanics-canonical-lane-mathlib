import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.InstabilityCriteria

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure ConstitutiveLaw where
  stressStrainRelation : Type u
  nonlinearityDegree : Nat
  monotonicity : Prop

structure EquilibriumPath where
  displacementField : Type v
  loadParameter : Type w
  equilibriumEquations : Prop
  stabilityAlongPath : Prop

structure NonlinearMechanicsPackage where
  constitutive : ConstitutiveLaw
  equilibrium : EquilibriumPath
  geometricNonlinearity : Prop
  materialNonlinearity : Prop

structure NonlinearMechanicsEvidence (M : NonlinearMechanicsPackage) where
  constitutiveMonotonicityClosed : M.constitutive.monotonicity
  equilibriumEquationsClosed : M.equilibrium.equilibriumEquations
  geometricNonlinearityClosed : M.geometricNonlinearity
  materialNonlinearityClosed : M.materialNonlinearity

def NonlinearMechanicsClosed (M : NonlinearMechanicsPackage) : Prop :=
  M.constitutive.monotonicity ∧ M.equilibrium.equilibriumEquations ∧
  M.geometricNonlinearity ∧ M.materialNonlinearity

theorem nonlinear_mechanics_closed_from_evidence (M : NonlinearMechanicsPackage) (E : NonlinearMechanicsEvidence M) :
  NonlinearMechanicsClosed M := by
  exact And.intro E.constitutiveMonotonicityClosed (And.intro E.equilibriumEquationsClosed
    (And.intro E.geometricNonlinearityClosed E.materialNonlinearityClosed))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse