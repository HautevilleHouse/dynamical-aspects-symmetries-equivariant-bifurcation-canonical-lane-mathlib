import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.AdmissibleClass

/-!
# Equivariant Dynamics Layer

This module frames the core equivariant dynamical system as an admissible-class bridge.
-/

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure EquivariantDynamicsPackage (G : Type) [Group G] (M : Type) [TopologicalSpace M] [MulAction G M] where
  flow : ℝ → M → M
  equivariance : ∀ (g : G) (t : ℝ) (x : M), flow t (g • x) = g • flow t x
  fixedPointSpace : Set M
  bifurcationParameter : Set ℝ
  bifurcationCondition : Prop

def EquivariantDynamicsClosed {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] (F : EquivariantDynamicsPackage G M) : Prop :=
  F.equivariance ∧ F.bifurcationCondition

structure EquivariantDynamicsEvidence {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] (F : EquivariantDynamicsPackage G M) where
  equivarianceClosed : F.equivariance
  bifurcationConditionClosed : F.bifurcationCondition

theorem equivariant_dynamics_closed_from_evidence {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M]
    (F : EquivariantDynamicsPackage G M) (E : EquivariantDynamicsEvidence F) : EquivariantDynamicsClosed F := by
  exact And.intro E.equivarianceClosed E.bifurcationConditionClosed

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse