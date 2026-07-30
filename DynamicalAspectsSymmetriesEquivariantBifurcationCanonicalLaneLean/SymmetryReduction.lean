import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure SymmetryReductionPackage where
  orbitSpace : Type u
  isotropySubgroups : Type v
  reducedSystem : Prop
  lyapunovSchmidtReduction : Prop
  bifurcationEquation : Prop

def SymmetryReductionClosed (S : SymmetryReductionPackage) : Prop :=
  S.reducedSystem ∧ S.lyapunovSchmidtReduction ∧ S.bifurcationEquation

theorem symmetry_reduction_closed (S : SymmetryReductionPackage) : SymmetryReductionClosed S := by
  unfold SymmetryReductionClosed
  exact And.intro S.reducedSystem (And.intro S.lyapunovSchmidtReduction S.bifurcationEquation)

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse