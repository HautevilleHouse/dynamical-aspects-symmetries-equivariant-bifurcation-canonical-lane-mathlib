import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure BirkhoffNormalForm where
  linearPart : Type u
  symmetryGroup : Type v
  normalFormCoefficients : Prop
  symmetryReduction : Prop

structure EquivariantBifurcationAdmittedObject where
  birkhoff : BirkhoffNormalForm
  bifurcationParameter : Type w
  steadyStateBranch : Prop
  symmetryBreaking : Prop
  conclusion : steadyStateBranch ∧ symmetryBreaking

structure AdmissibleClass where
  object : EquivariantBifurcationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EquivariantWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse