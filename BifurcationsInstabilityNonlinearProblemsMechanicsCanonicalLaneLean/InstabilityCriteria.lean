import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.BifurcationAnalysis

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure LyapunovFunction where
  domain : Type u
  functionDef : Prop
  positiveDefinite : Prop
  derivativeNegative : Prop

structure InstabilityIndicator where
  criticalCurvature : Prop
  flutterCondition : Prop
  divergenceCondition : Prop

structure InstabilityCriteriaPackage where
  lyapunovAvailable : LyapunovFunction
  indicators : InstabilityIndicator
  instabilityCondition : Prop

structure InstabilityCriteriaEvidence (I : InstabilityCriteriaPackage) where
  lyapunovPositiveClosed : I.lyapunovAvailable.positiveDefinite
  lyapunovDerivativeClosed : I.lyapunovAvailable.derivativeNegative
  indicatorsClosed : I.indicators.criticalCurvature ∧ I.indicators.flutterCondition ∧ I.indicators.divergenceCondition
  instabilityConditionClosed : I.instabilityCondition

def InstabilityCriteriaClosed (I : InstabilityCriteriaPackage) : Prop :=
  I.lyapunovAvailable.positiveDefinite ∧ I.lyapunovAvailable.derivativeNegative ∧
  I.indicators.criticalCurvature ∧ I.indicators.flutterCondition ∧ I.indicators.divergenceCondition ∧
  I.instabilityCondition

theorem instability_criteria_closed_from_evidence (I : InstabilityCriteriaPackage) (E : InstabilityCriteriaEvidence I) :
  InstabilityCriteriaClosed I := by
  refine And.intro E.lyapunovPositiveClosed (And.intro E.lyapunovDerivativeClosed
    (And.intro E.indicatorsClosed.left (And.intro E.indicatorsClosed.right.left
      (And.intro E.indicatorsClosed.right.right E.instabilityConditionClosed))))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse