import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure CenterManifoldPackage where
  centerManifold : Prop
  reductionProcedure : Prop
  equivariantProperty : Prop
  parameterDependence : Prop

def CenterManifoldClosed (C : CenterManifoldPackage) : Prop :=
  C.centerManifold ∧ C.reductionProcedure ∧ C.equivariantProperty ∧ C.parameterDependence

theorem center_manifold_closed (C : CenterManifoldPackage) : CenterManifoldClosed C := by
  unfold CenterManifoldClosed
  simp

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse