import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure CriticalLoadPackage where
  loadParameter : Type u
  criticalValue : loadParameter
  bucklingCondition : loadParameter → Prop
  imperfectionSensitivity : Prop
  postCriticalBehavior : Prop

structure CriticalLoadEvidence (C : CriticalLoadPackage) where
  criticalValueTerm : C.criticalValue = C.criticalValue
  bucklingConditionTerm : C.bucklingCondition C.criticalValue
  imperfectionSensitivityTerm : C.imperfectionSensitivity
  postCriticalBehaviorTerm : C.postCriticalBehavior

def CriticalLoadClosed (C : CriticalLoadPackage) : Prop :=
  (C.bucklingCondition C.criticalValue) ∧ C.imperfectionSensitivity ∧ C.postCriticalBehavior

theorem critical_load_closed_from_evidence (C : CriticalLoadPackage)
    (E : CriticalLoadEvidence C) : CriticalLoadClosed C := by
  exact And.intro E.bucklingConditionTerm (And.intro E.imperfectionSensitivityTerm E.postCriticalBehaviorTerm)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse