import EquivariantBifurcationCanonicalLaneLean.CenterManifoldReduction

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure DynamicalSymmetryClassificationPackage {A : AdmissibleClass}
    {L : LiapunovSchmidtReductionPackage A}
    {S : SymmetryBreakingBifurcationPackage L}
    (C : CenterManifoldReductionPackage S) where
  groupOrbitsClassified : Prop
  bifurcationDiagramComplete : Prop
  stabilityRegionsMapped : Prop
  heteroclinicConnections : Prop

structure DynamicalSymmetryClassificationEvidence
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    {S : SymmetryBreakingBifurcationPackage L}
    {C : CenterManifoldReductionPackage S}
    (D : DynamicalSymmetryClassificationPackage C) where
  groupOrbitsClassifiedClosed : D.groupOrbitsClassified
  bifurcationDiagramCompleteClosed : D.bifurcationDiagramComplete
  stabilityRegionsMappedClosed : D.stabilityRegionsMapped
  heteroclinicConnectionsClosed : D.heteroclinicConnections

def DynamicalSymmetryClassificationClosed
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    {S : SymmetryBreakingBifurcationPackage L}
    {C : CenterManifoldReductionPackage S}
    (D : DynamicalSymmetryClassificationPackage C) : Prop :=
  D.groupOrbitsClassified ∧ D.bifurcationDiagramComplete ∧
  D.stabilityRegionsMapped ∧ D.heteroclinicConnections

theorem dynamical_symmetry_classification_closed_from_evidence
    {A : AdmissibleClass} {L : LiapunovSchmidtReductionPackage A}
    {S : SymmetryBreakingBifurcationPackage L}
    {C : CenterManifoldReductionPackage S}
    (D : DynamicalSymmetryClassificationPackage C)
    (E : DynamicalSymmetryClassificationEvidence D) :
    DynamicalSymmetryClassificationClosed D := by
  exact And.intro E.groupOrbitsClassifiedClosed
    (And.intro E.bifurcationDiagramCompleteClosed
      (And.intro E.stabilityRegionsMappedClosed E.heteroclinicConnectionsClosed))

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse