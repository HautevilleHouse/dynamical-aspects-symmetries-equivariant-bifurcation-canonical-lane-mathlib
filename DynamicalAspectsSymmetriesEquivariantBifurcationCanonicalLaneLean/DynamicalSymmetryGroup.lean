import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure DynamicalSymmetryGroupPackage (A : AdmissibleClass) where
  group : Type u
  action : A → group → A
  continuity : Prop
  equivariance : Prop
  symmetryClosed : Prop

def DynamicalSymmetryGroupClosed {A : AdmissibleClass} (G : DynamicalSymmetryGroupPackage A) : Prop :=
  G.continuity ∧ G.equivariance ∧ G.symmetryClosed

theorem dynamical_symmetry_group_closed_from_props {A : AdmissibleClass}
    (G : DynamicalSymmetryGroupPackage A) (hcont : G.continuity) (hequiv : G.equivariance)
    (hsym : G.symmetryClosed) : DynamicalSymmetryGroupClosed G := by
  exact And.intro hcont (And.intro hequiv hsym)

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse