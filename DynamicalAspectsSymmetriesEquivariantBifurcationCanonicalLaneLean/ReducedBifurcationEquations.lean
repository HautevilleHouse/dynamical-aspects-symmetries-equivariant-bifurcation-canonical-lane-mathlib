import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure ReducedBifurcationEquationsPackage {G : Type u} [Group G] {V : Type} [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    (Rep : Representation G V) (B : EquivariantBranchEquationPackage G V Rep) where
  reducedEquation : V → V
  reductionMap : V → V
  equivariance : ∀ (g : G) (v : V), reducedEquation (Rep.ρ g v) = Rep.ρ g (reducedEquation v)
  relation : ∀ (v : V), reducedEquation (reductionMap v) = reductionMap (B.branchEquation v)

structure ReducedBifurcationEquationsEvidence {G : Type u} [Group G] {V : Type} [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    {Rep : Representation G V} {B : EquivariantBranchEquationPackage G V Rep}
    (R : ReducedBifurcationEquationsPackage G V Rep B) where
  equivarianceClosed : R.equivariance
  relationClosed : R.relation

def ReducedBifurcationEquationsClosed {G : Type u} [Group G] {V : Type} [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    {Rep : Representation G V} {B : EquivariantBranchEquationPackage G V Rep}
    (R : ReducedBifurcationEquationsPackage G V Rep B) : Prop :=
  R.equivariance ∧ R.relation

theorem reduced_bifurcation_equations_closed_from_evidence {G : Type u} [Group G] {V : Type} [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    {Rep : Representation G V} {B : EquivariantBranchEquationPackage G V Rep}
    (R : ReducedBifurcationEquationsPackage G V Rep B) (E : ReducedBifurcationEquationsEvidence R) : ReducedBifurcationEquationsClosed R := by
  exact And.intro E.equivarianceClosed E.relationClosed

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse