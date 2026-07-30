import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure CenterManifoldEquivariantPackage {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (V : EquivariantVectorFieldPackage G M) (P : EquivariantBifurcationPointPackage V) where
  centerManifold : Submanifold M
  invariantUnderGroup : ∀ (g : G), g • (centerManifold : Set M) = centerManifold
  tangentSpaceDecomposition : LinearEquiv (TangentSpace P.point) (CenterSpace × StableUnstableSpace)

structure CenterManifoldEquivariantEvidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    {V : EquivariantVectorFieldPackage G M} {P : EquivariantBifurcationPointPackage V}
    (C : CenterManifoldEquivariantPackage V P) where
  invariantUnderGroupClosed : C.invariantUnderGroup
  tangentSpaceDecompositionClosed : C.tangentSpaceDecomposition ≠ 0

def CenterManifoldEquivariantClosed {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    {V : EquivariantVectorFieldPackage G M} {P : EquivariantBifurcationPointPackage V}
    (C : CenterManifoldEquivariantPackage V P) : Prop :=
  C.invariantUnderGroup ∧ C.tangentSpaceDecomposition ≠ 0

theorem center_manifold_equivariant_closed_from_evidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    {V : EquivariantVectorFieldPackage G M} {P : EquivariantBifurcationPointPackage V}
    (C : CenterManifoldEquivariantPackage V P) (E : CenterManifoldEquivariantEvidence C) : CenterManifoldEquivariantClosed C := by
  exact And.intro E.invariantUnderGroupClosed E.tangentSpaceDecompositionClosed

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse