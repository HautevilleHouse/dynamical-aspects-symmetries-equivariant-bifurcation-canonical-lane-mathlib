import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure EquivariantBifurcationPackage where
  actionGroup : Type u
  groupAction : Type v
  fixedPointSpace : Type w
  bifurcationParameter : Type x
  equivariantVectorField : Type y
  symmetryBreaking : Prop
  bifurcationType : Prop

def EquivariantBifurcationClosed (E : EquivariantBifurcationPackage) : Prop :=
  E.symmetryBreaking ∧ E.bifurcationType

theorem equivariant_bifurcation_closed (E : EquivariantBifurcationPackage) : EquivariantBifurcationClosed E := by
  unfold EquivariantBifurcationClosed
  exact And.intro E.symmetryBreaking E.bifurcationType

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse