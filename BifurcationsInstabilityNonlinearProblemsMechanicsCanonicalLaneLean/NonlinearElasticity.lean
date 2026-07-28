import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.InstabilityCriteria

/-!
# Nonlinear Elasticity Package
-/

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure NonlinearElasticityPackage {P : BifurcationAnalysisPackage}
    {I : InstabilityCriteriaPackage P} where
  constitutiveLaw : Prop
  finiteStrain : Prop
  stressMeasure : Prop
  incrementalEquilibrium : Prop

structure NonlinearElasticityEvidence {P : BifurcationAnalysisPackage}
    {I : InstabilityCriteriaPackage P} (E : NonlinearElasticityPackage P I) where
  constitutiveLawClosed : E.constitutiveLaw
  finiteStrainClosed : E.finiteStrain
  stressMeasureClosed : E.stressMeasure
  incrementalEquilibriumClosed : E.incrementalEquilibrium

def NonlinearElasticityClosed {P : BifurcationAnalysisPackage}
    {I : InstabilityCriteriaPackage P} (E : NonlinearElasticityPackage P I) : Prop :=
  E.constitutiveLaw ∧ E.finiteStrain ∧ E.stressMeasure ∧ E.incrementalEquilibrium

theorem nonlinear_elasticity_closed_from_evidence {P : BifurcationAnalysisPackage}
    {I : InstabilityCriteriaPackage P} (E : NonlinearElasticityPackage P I)
    (Ev : NonlinearElasticityEvidence E) : NonlinearElasticityClosed E := by
  exact And.intro Ev.constitutiveLawClosed
    (And.intro Ev.finiteStrainClosed
      (And.intro Ev.stressMeasureClosed Ev.incrementalEquilibriumClosed))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse