import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.MathlibObjects

/-!
# Lie Group Action Package
-/

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure LieGroupAction where
  groupType : Type u
  groupTopology : TopologicalSpace groupType
  groupLieStructure : Prop
  manifoldType : Type v
  manifoldTopology : TopologicalSpace manifoldType
  action : groupType → manifoldType → manifoldType
  smoothAction : Prop

def LieGroupActionClosed (G : LieGroupAction) : Prop :=
  G.groupLieStructure ∧ G.smoothAction

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse