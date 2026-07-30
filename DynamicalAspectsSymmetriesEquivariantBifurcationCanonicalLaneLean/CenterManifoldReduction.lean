import EquivariantBifurcationCanonicalLaneLean.SymmetryBreakingBifurcation

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure CenterManifoldReductionPackage {A : AdmissibleClass}
    {L : LiapunovSchmidtReductionPackage A}
    (S : SymmetryBreakingBifurcationPackage L) where
  centerManifoldExists : Prop
  flowOnCenterManifold : Prop
  reductionCorrect : Prop
  symmetryPreserved : Prop

structure CenterManifoldReductionEvidence
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    {S : SymmetryBreakingBifurcationPackage L}
    (C : CenterManifoldReductionPackage S) where
  centerManifoldExistsClosed : C.centerManifoldExists
  flowOnCenterManifoldClosed : C.flowOnCenterManifold
  reductionCorrectClosed : C.reductionCorrect
  symmetryPreservedClosed : C.symmetryPreserved

def CenterManifoldReductionClosed
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    {S : SymmetryBreakingBifurcationPackage L}
    (C : CenterManifoldReductionPackage S) : Prop :=
  C.centerManifoldExists ∧ C.flowOnCenterManifold ∧ C.reductionCorrect ∧ C.symmetryPreserved

theorem center_manifold_reduction_closed_from_evidence
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    {S : SymmetryBreakingBifurcationPackage L}
    (C : CenterManifoldReductionPackage S)
    (E : CenterManifoldReductionEvidence C) : CenterManifoldReductionClosed C := by
  exact And.intro E.centerManifoldExistsClosed
    (And.intro E.flowOnCenterManifoldClosed
      (And.intro E.reductionCorrectClosed E.symmetryPreservedClosed))

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse