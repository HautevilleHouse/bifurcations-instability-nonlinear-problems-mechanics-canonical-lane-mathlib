import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.BifurcationParameterPackage

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure LinearizedStabilityPackage {P : NonlinearOperatorPackage} {B : BifurcationParameterPackage P} where
  linearizedOperator : P.operator → LinearMap P.domain P.codomain
  eigenvalueAnalysis : Prop
  zeroEigenvalueCondition : Prop

def LinearizedStabilityEvidence {P : NonlinearOperatorPackage} {B : BifurcationParameterPackage P} (L : LinearizedStabilityPackage) : Prop :=
  L.eigenvalueAnalysis ∧ L.zeroEigenvalueCondition

def LinearizedStabilityClosed {P : NonlinearOperatorPackage} {B : BifurcationParameterPackage P} (L : LinearizedStabilityPackage) : Prop :=
  L.eigenvalueAnalysis ∧ L.zeroEigenvalueCondition

theorem linearized_stability_closed_from_evidence {P : NonlinearOperatorPackage} {B : BifurcationParameterPackage P} (L : LinearizedStabilityPackage) (E : LinearizedStabilityEvidence L) :
    LinearizedStabilityClosed L := E

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse