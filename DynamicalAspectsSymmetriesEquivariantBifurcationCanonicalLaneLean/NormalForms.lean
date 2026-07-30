import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure NormalFormPackage where
  normalForm : Prop
  poincareBirkhoff : Prop
  resonantTerms : Prop
  symmetryConstraints : Prop

def NormalFormClosed (N : NormalFormPackage) : Prop :=
  N.normalForm ∧ N.poincareBirkhoff ∧ N.resonantTerms ∧ N.symmetryConstraints

theorem normal_form_closed (N : NormalFormPackage) : NormalFormClosed N := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact N.normalForm
  · exact N.poincareBirkhoff
  · exact N.resonantTerms
  · exact N.symmetryConstraints

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse