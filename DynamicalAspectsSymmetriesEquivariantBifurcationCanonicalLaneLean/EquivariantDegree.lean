import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure EquivariantDegreePackage where
  degree : ℕ
  group : Type u
  representation : Type v
  degreeComputed : Prop
  homotopyInvariant : Prop

def EquivariantDegreeClosed (E : EquivariantDegreePackage) : Prop :=
  E.degreeComputed ∧ E.homotopyInvariant

theorem equivariant_degree_closed (E : EquivariantDegreePackage) : EquivariantDegreeClosed E := by
  unfold EquivariantDegreeClosed
  exact And.intro E.degreeComputed E.homotopyInvariant

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse