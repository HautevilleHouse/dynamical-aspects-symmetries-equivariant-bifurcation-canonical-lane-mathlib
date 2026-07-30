import EquivariantBifurcationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EquivariantBifurcationCanonicalLaneLean

structure LiapunovSchmidtReductionPackage (A : AdmissibleClass) where
  kernelDecomposition : Prop
  rangeProjection : Prop
  bifurcationEquation : Prop
  reducedEquivariant : Prop

structure LiapunovSchmidtReductionEvidence {A : AdmissibleClass} (L : LiapunovSchmidtReductionPackage A) where
  kernelDecompositionClosed : L.kernelDecomposition
  rangeProjectionClosed : L.rangeProjection
  bifurcationEquationClosed : L.bifurcationEquation
  reducedEquivariantClosed : L.reducedEquivariant

def LiapunovSchmidtReductionClosed {A : AdmissibleClass} (L : LiapunovSchmidtReductionPackage A) : Prop :=
  L.kernelDecomposition ∧ L.rangeProjection ∧ L.bifurcationEquation ∧ L.reducedEquivariant

theorem liapunov_schmidt_reduction_closed_from_evidence
    {A : AdmissibleClass} (L : LiapunovSchmidtReductionPackage A)
    (E : LiapunovSchmidtReductionEvidence L) : LiapunovSchmidtReductionClosed L := by
  exact And.intro E.kernelDecompositionClosed
    (And.intro E.rangeProjectionClosed
      (And.intro E.bifurcationEquationClosed E.reducedEquivariantClosed))

end EquivariantBifurcationCanonicalLaneLean
end HautevilleHouse