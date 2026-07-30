import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure DynamicalSystemPackage where
  stateSpace : Type u
  timeSpace : Type v
  flow : timeSpace → stateSpace → stateSpace
  continuousInTime : Prop
  smoothInState : Prop
  dynamicalClosed : Prop

def DynamicalSystemClosed (D : DynamicalSystemPackage) : Prop :=
  D.continuousInTime ∧ D.smoothInState ∧ D.dynamicalClosed

theorem dynamical_system_closed_from_props (D : DynamicalSystemPackage)
    (hcont : D.continuousInTime) (hsmooth : D.smoothInState) (hc : D.dynamicalClosed) :
    DynamicalSystemClosed D := by
  exact And.intro hcont (And.intro hsmooth hc)

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse