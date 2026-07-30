import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure EquivariantVectorFieldPackage (G : Type u) [Group G] (M : Type v) [TopologicalSpace M] [SmoothManifold M] where
  action : G → M → M
  smoothAction : C^∞ (G × M, M)
  vectorField : VectorField M
  equivariance : ∀ (g : G) (x : M), vectorField (action g x) = (T_action g).map (vectorField x)

structure EquivariantVectorFieldEvidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (V : EquivariantVectorFieldPackage G M) where
  smoothActionClosed : V.smoothAction ≠ 0
  equivarianceClosed : V.equivariance

def EquivariantVectorFieldClosed {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (V : EquivariantVectorFieldPackage G M) : Prop :=
  V.smoothAction ≠ 0 ∧ V.equivariance

theorem equivariant_vector_field_closed_from_evidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (V : EquivariantVectorFieldPackage G M) (E : EquivariantVectorFieldEvidence V) : EquivariantVectorFieldClosed V := by
  exact And.intro E.smoothActionClosed E.equivarianceClosed

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse