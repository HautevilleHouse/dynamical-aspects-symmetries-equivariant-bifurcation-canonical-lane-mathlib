import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.LiapunovSchmidtReduction

/-!
# Equivariant Bifurcation Equations Package
-/

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure EquivariantBifurcationEquationsPackage {G : LieGroupAction}
    (V : EquivariantVectorFieldPackage G) where
  reducedEquation : Type
  equivarianceUnderG : Prop
  bifurcationCondition : Prop
  symmetryBreakingTerms : Prop

structure EquivariantBifurcationEquationsEvidence {G : LieGroupAction}
    {V : EquivariantVectorFieldPackage G}
    (E : EquivariantBifurcationEquationsPackage V) where
  reducedEquationClosed : E.reducedEquation
  equivarianceUnderGClosed : E.equivarianceUnderG
  bifurcationConditionClosed : E.bifurcationCondition
  symmetryBreakingTermsClosed : E.symmetryBreakingTerms

def EquivariantBifurcationEquationsClosed {G : LieGroupAction}
    {V : EquivariantVectorFieldPackage G}
    (E : EquivariantBifurcationEquationsPackage V) : Prop :=
  E.reducedEquation ∧ E.equivarianceUnderG ∧
  E.bifurcationCondition ∧ E.symmetryBreakingTerms

theorem equivariant_bifurcation_equations_closed_from_evidence
    {G : LieGroupAction} {V : EquivariantVectorFieldPackage G}
    (E : EquivariantBifurcationEquationsPackage V)
    (Ev : EquivariantBifurcationEquationsEvidence E) :
    EquivariantBifurcationEquationsClosed E := by
  exact And.intro Ev.reducedEquationClosed
    (And.intro Ev.equivarianceUnderGClosed
      (And.intro Ev.bifurcationConditionClosed Ev.symmetryBreakingTermsClosed))

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse