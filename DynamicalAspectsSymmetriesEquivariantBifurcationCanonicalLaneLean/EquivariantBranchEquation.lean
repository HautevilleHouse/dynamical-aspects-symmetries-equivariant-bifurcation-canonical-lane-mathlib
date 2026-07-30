import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean

structure EquivariantBranchEquationPackage {G : Type u} [Group G] (V : E : Type) [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    (Rep : Representation G V) where
  branchEquation : V → V
  equivariance : ∀ (g : G) (v : V), branchEquation (Rep.ρ g v) = Rep.ρ g (branchEquation v)
  zeroFixpoint : branchEquation 0 = 0

structure EquivariantBranchEquationEvidence {G : Type u} [Group G] {V : Type} [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    {Rep : Representation G V} (B : EquivariantBranchEquationPackage G V Rep) where
  equivarianceClosed : B.equivariance
  zeroFixpointClosed : B.zeroFixpoint

def EquivariantBranchEquationClosed {G : Type u} [Group G] {V : Type} [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    {Rep : Representation G V} (B : EquivariantBranchEquationPackage G V Rep) : Prop :=
  B.equivariance ∧ B.zeroFixpoint

theorem equivariant_branch_equation_closed_from_evidence {G : Type u} [Group G] {V : Type} [TopologicalSpace V] [AddCommGroup V] [Module ℝ V]
    {Rep : Representation G V} (B : EquivariantBranchEquationPackage G V Rep) (E : EquivariantBranchEquationEvidence B) : EquivariantBranchEquationClosed B := by
  exact And.intro E.equivarianceClosed E.zeroFixpointClosed

end DynamicalAspectsSymmetriesEquivariantBifurcationCanonicalLaneLean
end HautevilleHouse