import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure EquivariantBifurcationPackage {A : AdmissibleClass}
    (G : DynamicalSymmetryGroupPackage A) where
  bifurcationPoint : Prop
  symmetryBreaking : Prop
  equivariantBranching : Prop
  bifurcationClosed : Prop

def EquivariantBifurcationClosed {A : AdmissibleClass} {G : DynamicalSymmetryGroupPackage A}
    (E : EquivariantBifurcationPackage G) : Prop :=
  E.bifurcationPoint ∧ E.symmetryBreaking ∧ E.equivariantBranching ∧ E.bifurcationClosed

theorem equivariant_bifurcation_closed_from_props {A : AdmissibleClass}
    {G : DynamicalSymmetryGroupPackage A} (E : EquivariantBifurcationPackage G)
    (hp : E.bifurcationPoint) (hsb : E.symmetryBreaking) (heb : E.equivariantBranching)
    (hc : E.bifurcationClosed) : EquivariantBifurcationClosed E := by
  exact And.intro hp (And.intro hsb (And.intro heb hc))

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse