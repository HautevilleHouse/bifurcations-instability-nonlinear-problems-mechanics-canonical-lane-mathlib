import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.BucklingLoadAnalysis

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure HopfBifurcationPackage {B : BucklingLoadPackage} where
  periodicOrbitEmergence : Prop
  hopfConditionSatisfied : Prop
  centerManifoldReduction : Prop
  normalFormComputed : Prop
  stabilityExchange : Prop

structure HopfBifurcationEvidence {B : BucklingLoadPackage}
    (H : HopfBifurcationPackage B) where
  periodicOrbitEmergenceClosed : H.periodicOrbitEmergence
  hopfConditionSatisfiedClosed : H.hopfConditionSatisfied
  centerManifoldReductionClosed : H.centerManifoldReduction
  normalFormComputedClosed : H.normalFormComputed
  stabilityExchangeClosed : H.stabilityExchange

def HopfBifurcationClosed {B : BucklingLoadPackage}
    (H : HopfBifurcationPackage B) : Prop :=
  H.periodicOrbitEmergence ∧ H.hopfConditionSatisfied ∧
  H.centerManifoldReduction ∧ H.normalFormComputed ∧ H.stabilityExchange

theorem hopf_bifurcation_closed_from_evidence {B : BucklingLoadPackage}
    (H : HopfBifurcationPackage B) (E : HopfBifurcationEvidence H) :
    HopfBifurcationClosed H := by
  exact And.intro E.periodicOrbitEmergenceClosed
    (And.intro E.hopfConditionSatisfiedClosed
      (And.intro E.centerManifoldReductionClosed
        (And.intro E.normalFormComputedClosed E.stabilityExchangeClosed)))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse