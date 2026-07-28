import BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean.HopfBifurcationLayered

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure LyapunovSchmidtReductionPackage {B : BucklingLoadPackage}
    {H : HopfBifurcationPackage B} where
  projectionToKernel : Prop
  bifurcationEquationReduced : Prop
  implicitFunctionApplied : Prop
  solutionBranchParameterized : Prop

def LyapunovSchmidtReductionClosed {B : BucklingLoadPackage}
    {H : HopfBifurcationPackage B} (L : LyapunovSchmidtReductionPackage H) : Prop :=
  L.projectionToKernel ∧ L.bifurcationEquationReduced ∧
  L.implicitFunctionApplied ∧ L.solutionBranchParameterized

structure LyapunovSchmidtReductionEvidence {B : BucklingLoadPackage}
    {H : HopfBifurcationPackage B} (L : LyapunovSchmidtReductionPackage H) where
  projectionToKernelClosed : L.projectionToKernel
  bifurcationEquationReducedClosed : L.bifurcationEquationReduced
  implicitFunctionAppliedClosed : L.implicitFunctionApplied
  solutionBranchParameterizedClosed : L.solutionBranchParameterized

theorem lyapunov_schmidt_reduction_closed_from_evidence
    {B : BucklingLoadPackage} {H : HopfBifurcationPackage B}
    (L : LyapunovSchmidtReductionPackage H)
    (E : LyapunovSchmidtReductionEvidence L) :
    LyapunovSchmidtReductionClosed L := by
  exact And.intro E.projectionToKernelClosed
    (And.intro E.bifurcationEquationReducedClosed
      (And.intro E.implicitFunctionAppliedClosed E.solutionBranchParameterizedClosed))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse