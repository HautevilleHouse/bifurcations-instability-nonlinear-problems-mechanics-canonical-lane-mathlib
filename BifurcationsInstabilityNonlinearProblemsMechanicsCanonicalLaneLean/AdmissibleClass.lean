import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : BifurcationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BifurcationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse