import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

def equivariantProjection : Projection EquivariantEndgameState := {
  toFun := fun x => x
  idempotent := by intro x; rfl
}

theorem equivariant_projection_idempotent (x : EquivariantEndgameState) :
    equivariantProjection.toFun (equivariantProjection.toFun x) = equivariantProjection.toFun x := by
  exact equivariantProjection.idempotent x

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse