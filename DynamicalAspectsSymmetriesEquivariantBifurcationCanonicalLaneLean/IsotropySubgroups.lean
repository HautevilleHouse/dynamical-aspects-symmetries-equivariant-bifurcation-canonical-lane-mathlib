import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.EquivariantBifurcationEquations

/-!
# Isotropy Subgroups Package
-/

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure IsotropySubgroupsPackage {G : LieGroupAction}
    {V : EquivariantVectorFieldPackage G}
    (E : EquivariantBifurcationEquationsPackage V) where
  isotropyLattice : Type
  maximalIsotropyType : Prop
  fixedPointSubspaces : Prop
  symmetryBreakingPatterns : Prop

structure IsotropySubgroupsEvidence {G : LieGroupAction}
    {V : EquivariantVectorFieldPackage G}
    {E : EquivariantBifurcationEquationsPackage V}
    (I : IsotropySubgroupsPackage E) where
  maximalIsotropyTypeClosed : I.maximalIsotropyType
  fixedPointSubspacesClosed : I.fixedPointSubspaces
  symmetryBreakingPatternsClosed : I.symmetryBreakingPatterns

def IsotropySubgroupsClosed {G : LieGroupAction}
    {V : EquivariantVectorFieldPackage G}
    {E : EquivariantBifurcationEquationsPackage V}
    (I : IsotropySubgroupsPackage E) : Prop :=
  I.maximalIsotropyType ∧ I.fixedPointSubspaces ∧ I.symmetryBreakingPatterns

theorem isotropy_subgroups_closed_from_evidence
    {G : LieGroupAction} {V : EquivariantVectorFieldPackage G}
    {E : EquivariantBifurcationEquationsPackage V}
    (I : IsotropySubgroupsPackage E) (Ev : IsotropySubgroupsEvidence I) :
    IsotropySubgroupsClosed I := by
  exact And.intro Ev.maximalIsotropyTypeClosed
    (And.intro Ev.fixedPointSubspacesClosed Ev.symmetryBreakingPatternsClosed)

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse