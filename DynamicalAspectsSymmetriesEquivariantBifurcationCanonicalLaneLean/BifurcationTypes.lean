import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

inductive BifurcationType
  | pitchfork
  | hopf
  | steadyState
  | periodDoubling

structure BifurcationTypePackage where
  type : BifurcationType
  parameterValue : ℝ
  stabilityChange : Prop
  classificationComplete : Prop

def BifurcationTypeClosed (B : BifurcationTypePackage) : Prop :=
  B.classificationComplete ∧ B.stabilityChange

theorem bifurcation_type_closed (B : BifurcationTypePackage) : BifurcationTypeClosed B :=
  by
    unfold BifurcationTypeClosed
    exact And.intro B.classificationComplete B.stabilityChange

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse