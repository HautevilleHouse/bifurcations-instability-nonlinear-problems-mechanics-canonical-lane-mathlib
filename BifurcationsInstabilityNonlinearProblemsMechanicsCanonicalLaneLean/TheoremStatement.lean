import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure TheoremStatement where
  theoremName : String
  loadParameterRange : ℝ × ℝ
  bifurcationCondition : Prop
  stabilityGuarantee : Prop
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement :=
  { theoremName := "BifurcationsInstabilityNonlinearProblemsMechanics",
    loadParameterRange := (0.0, 1.0),
    bifurcationCondition := True,
    stabilityGuarantee := True,
    carriedRemainder := "Classical boundary carried beyond admissible closure"
  }

theorem theorem_statement_defined : sourceTheoremStatement.theoremName = "BifurcationsInstabilityNonlinearProblemsMechanics" := by
  rfl

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse