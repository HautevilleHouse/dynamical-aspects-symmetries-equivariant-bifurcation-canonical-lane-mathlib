import DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean.TheoremStatement
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure EquivariantSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  group : Type
  groupAct : group → carrier → carrier

structure EquivariantAdmittedObject where
  space : EquivariantSpace
  symmetricDynamics : Prop
  equivariantBifurcationPoint : Prop
  equivariantType : Prop
  conclusion : equivariantBifurcationPoint

structure EquivariantEndgameState where
  object : EquivariantAdmittedObject

def EquivariantWitnessClosed (O : EquivariantAdmittedObject) : Prop :=
  O.equivariantBifurcationPoint

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse