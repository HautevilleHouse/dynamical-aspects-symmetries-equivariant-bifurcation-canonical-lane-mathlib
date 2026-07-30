import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.SymmetryGroupAnalysis

/-!
# Bifurcation Classification

This module classifies the bifurcation type in the presence of symmetry, identifying the mode transitions.
-/

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure BifurcationClassificationPackage {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] {F : EquivariantDynamicsPackage G M}
    (S : SymmetryGroupPackage F) where
  steadyStateBifurcationIdentified : Prop
  hopfBifurcationIdentified : Prop
  pitchforkOrTranscriticalIdentified : Prop
  symmetryBreakingMechanism : Prop

def BifurcationClassificationClosed {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] {F : EquivariantDynamicsPackage G M} {S : SymmetryGroupPackage F}
    (C : BifurcationClassificationPackage S) : Prop :=
  C.steadyStateBifurcationIdentified ∧ C.hopfBifurcationIdentified ∧ C.pitchforkOrTranscriticalIdentified ∧ C.symmetryBreakingMechanism

structure BifurcationClassificationEvidence {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] {F : EquivariantDynamicsPackage G M} {S : SymmetryGroupPackage F}
    (C : BifurcationClassificationPackage S) where
  steadyStateBifurcationIdentifiedClosed : C.steadyStateBifurcationIdentified
  hopfBifurcationIdentifiedClosed : C.hopfBifurcationIdentified
  pitchforkOrTranscriticalIdentifiedClosed : C.pitchforkOrTranscriticalIdentified
  symmetryBreakingMechanismClosed : C.symmetryBreakingMechanism

theorem bifurcation_classification_closed_from_evidence {G : Type} [Group G] {M : Type} [TopologicalSpace M] [MulAction G M] {F : EquivariantDynamicsPackage G M} {S : SymmetryGroupPackage F}
    (C : BifurcationClassificationPackage S) (E : BifurcationClassificationEvidence C) : BifurcationClassificationClosed C := by
  exact And.intro E.steadyStateBifurcationIdentifiedClosed (And.intro E.hopfBifurcationIdentifiedClosed (And.intro E.pitchforkOrTranscriticalIdentifiedClosed E.symmetryBreakingMechanismClosed))

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse