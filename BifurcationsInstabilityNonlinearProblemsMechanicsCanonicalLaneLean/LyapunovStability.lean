import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean

structure LyapunovStabilityPackage where
  dynamicalSystem : Type
  equilibrium : Type
  lyapunovFunction : Type
  positiveDefinite : Prop
  derivativeNegativeSemidefinite : Prop
  stabilityConcluded : Prop
  lyapunovTheorem : positiveDefinite ∧ derivativeNegativeSemidefinite → stabilityConcluded

structure LyapunovStabilityEvidence (P : LyapunovStabilityPackage) where
  positiveDefiniteClosed : P.positiveDefinite
  derivativeNegativeSemidefiniteClosed : P.derivativeNegativeSemidefinite
  stabilityConcludedClosed : P.stabilityConcluded
  lyapunovTheoremClosed : P.lyapunovTheorem

def LyapunovStabilityClosed (P : LyapunovStabilityPackage) : Prop :=
  P.positiveDefinite ∧ P.derivativeNegativeSemidefinite ∧ P.stabilityConcluded ∧ P.lyapunovTheorem

theorem lyapunov_stability_closed_from_evidence (P : LyapunovStabilityPackage) (E : LyapunovStabilityEvidence P) : LyapunovStabilityClosed P := by
  exact And.intro E.positiveDefiniteClosed (And.intro E.derivativeNegativeSemidefiniteClosed (And.intro E.stabilityConcludedClosed E.lyapunovTheoremClosed))

end BifurcationsInstabilityNonlinearProblemsMechanicsCanonicalLaneLean
end HautevilleHouse
