import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.EquivariantDynamicsLayer

/-!
# Symmetry Group Analysis

This module analyzes the symmetry group action on the dynamics, framing the group representation as part of the admissible bridge.
-/

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure SymmetryGroupPackage {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] (F : EquivariantDynamicsPackage G M) where
  groupIsCompact : Prop
  isotropySubgroupsClassified : Prop
  representationIrreducibleDecomposition : Prop
  equivariantLyapunovCenterTheorem : Prop

def SymmetryGroupClosed {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] {F : EquivariantDynamicsPackage G M} (S : SymmetryGroupPackage F) : Prop :=
  S.groupIsCompact ∧ S.isotropySubgroupsClassified ∧ S.representationIrreducibleDecomposition ∧ S.equivariantLyapunovCenterTheorem

structure SymmetryGroupEvidence {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] {F : EquivariantDynamicsPackage G M} (S : SymmetryGroupPackage F) where
  groupIsCompactClosed : S.groupIsCompact
  isotropySubgroupsClassifiedClosed : S.isotropySubgroupsClassified
  representationIrreducibleDecompositionClosed : S.representationIrreducibleDecomposition
  equivariantLyapunovCenterTheoremClosed : S.equivariantLyapunovCenterTheorem

theorem symmetry_group_closed_from_evidence {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] {F : EquivariantDynamicsPackage G M}
    (S : SymmetryGroupPackage F) (E : SymmetryGroupEvidence S) : SymmetryGroupClosed S := by
  exact And.intro E.groupIsCompactClosed (And.intro E.isotropySubgroupsClassifiedClosed (And.intro E.representationIrreducibleDecompositionClosed E.equivariantLyapunovCenterTheoremClosed))

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse