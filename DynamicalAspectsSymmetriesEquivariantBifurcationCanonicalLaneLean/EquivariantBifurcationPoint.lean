import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure EquivariantBifurcationPointPackage {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (V : EquivariantVectorFieldPackage G M) where
  point : M
  fixedPoint : ∀ (g : G), V.action g point = point
  bifurcationCondition : Prop

structure EquivariantBifurcationPointEvidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    {V : EquivariantVectorFieldPackage G M} (P : EquivariantBifurcationPointPackage V) where
  fixedPointClosed : P.fixedPoint
  bifurcationConditionClosed : P.bifurcationCondition

def EquivariantBifurcationPointClosed {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    {V : EquivariantVectorFieldPackage G M} (P : EquivariantBifurcationPointPackage V) : Prop :=
  P.fixedPoint ∧ P.bifurcationCondition

theorem equivariant_bifurcation_point_closed_from_evidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    {V : EquivariantVectorFieldPackage G M} (P : EquivariantBifurcationPointPackage V) (E : EquivariantBifurcationPointEvidence P) : EquivariantBifurcationPointClosed P := by
  exact And.intro E.fixedPointClosed E.bifurcationConditionClosed

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse