import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure BaumWelchPackage where
  expectationStepComputed : Prop
  maximizationStepConverges : Prop
  parameterIdentifiability : Prop
  expectationStepComputedClosed : expectationStepComputed
  maximizationStepConvergesClosed : maximizationStepConverges
  parameterIdentifiabilityClosed : parameterIdentifiability

def BaumWelchClosed (B : BaumWelchPackage) : Prop :=
  B.expectationStepComputed ∧ B.maximizationStepConverges ∧ B.parameterIdentifiability

theorem baum_welch_closed_from_evidence (B : BaumWelchPackage)
    (E : expectationStepComputedClosed B ∧ maximizationStepConvergesClosed B ∧ parameterIdentifiabilityClosed B) :
    BaumWelchClosed B := by
  exact And.intro E.1 (And.intro E.2.1 E.2.2)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse