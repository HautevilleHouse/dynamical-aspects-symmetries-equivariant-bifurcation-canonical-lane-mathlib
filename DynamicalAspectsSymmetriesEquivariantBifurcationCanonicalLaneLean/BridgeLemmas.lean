import EquivariantBifurcationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EquivariantWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse