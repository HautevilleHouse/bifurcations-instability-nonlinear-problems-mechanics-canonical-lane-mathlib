import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.NonlinearOperatorPackage

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure BifurcationParameterPackage (P : NonlinearOperatorPackage) where
  parameterSpace : Type u
  trivialSolution : parameterSpace → P.domain → P.codomain
  bifurcationPoints : Set (parameterSpace × P.domain)
  parameterDependence : Prop

def BifurcationParameterEvidence {P : NonlinearOperatorPackage} (B : BifurcationParameterPackage P) : Prop :=
  B.parameterDependence

def BifurcationParameterClosed {P : NonlinearOperatorPackage} (B : BifurcationParameterPackage P) : Prop :=
  B.parameterDependence

theorem bifurcation_parameter_closed_from_evidence {P : NonlinearOperatorPackage} (B : BifurcationParameterPackage P) (E : BifurcationParameterEvidence B) :
    BifurcationParameterClosed B := E

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse