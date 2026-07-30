import canonicalLaneMathlib.AdmissibleClass
import Mathlib.GroupTheory.GroupAction.Basic
import Mathlib.Geometry.Manifold.SmoothManifold

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure GroupActionOnManifoldPackage (G : Type u) [Group G] (M : Type v) [TopologicalSpace M] [SmoothManifold M] where
  groupAction : G → M → M
  smoothGroupAction : C^∞ (G × M, M)
  effectiveAction : EffectiveAction G M
  properAction : ProperAction G M

structure GroupActionOnManifoldEvidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (A : GroupActionOnManifoldPackage G M) where
  smoothGroupActionClosed : A.smoothGroupAction ≠ 0
  effectiveActionClosed : A.effectiveAction
  properActionClosed : A.properAction

def GroupActionOnManifoldClosed {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (A : GroupActionOnManifoldPackage G M) : Prop :=
  A.smoothGroupAction ≠ 0 ∧ A.effectiveAction ∧ A.properAction

theorem group_action_on_manifold_closed_from_evidence {G : Type u} [Group G] {M : Type v} [TopologicalSpace M] [SmoothManifold M]
    (A : GroupActionOnManifoldPackage G M) (E : GroupActionOnManifoldEvidence A) : GroupActionOnManifoldClosed A := by
  exact And.intro E.smoothGroupActionClosed (And.intro E.effectiveActionClosed E.properActionClosed)

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse