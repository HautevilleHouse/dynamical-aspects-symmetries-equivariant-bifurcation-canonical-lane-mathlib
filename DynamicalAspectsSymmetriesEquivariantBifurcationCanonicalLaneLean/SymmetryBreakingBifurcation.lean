import EquivariantBifurcationCanonicalLaneLean.LiapunovSchmidtReduction

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure SymmetryBreakingBifurcationPackage {A : AdmissibleClass}
    (L : LiapunovSchmidtReductionPackage A) where
  isotropySubgroups : Type u
  bifurcationTypes : Prop
  branchingDirection : Prop
  stabilityChange : Prop

structure SymmetryBreakingBifurcationEvidence
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    (S : SymmetryBreakingBifurcationPackage L) where
  isotropySubgroupsClassified : S.isotropySubgroups
  bifurcationTypesClosed : S.bifurcationTypes
  branchingDirectionClosed : S.branchingDirection
  stabilityChangeClosed : S.stabilityChange

def SymmetryBreakingBifurcationClosed
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    (S : SymmetryBreakingBifurcationPackage L) : Prop :=
  S.isotropySubgroups ∧ S.bifurcationTypes ∧ S.branchingDirection ∧ S.stabilityChange

theorem symmetry_breaking_bifurcation_closed_from_evidence
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    (S : SymmetryBreakingBifurcationPackage L)
    (E : SymmetryBreakingBifurcationEvidence S) : SymmetryBreakingBifurcationClosed S := by
  exact And.intro E.isotropySubgroupsClassified
    (And.intro E.bifurcationTypesClosed
      (And.intro E.branchingDirectionClosed E.stabilityChangeClosed))

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse