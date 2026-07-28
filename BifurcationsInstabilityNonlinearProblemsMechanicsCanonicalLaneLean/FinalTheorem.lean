import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

def ConstrainedBifurcationInstabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bifurcation_instability_endgame (A : AdmissibleClass) :
  ConstrainedBifurcationInstabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse