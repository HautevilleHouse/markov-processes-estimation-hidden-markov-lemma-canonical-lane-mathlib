import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure FilteringRecursion where
  predictionStep : Prop
  updateStep : Prop
  forwardAlgorithm : Prop
  predictionStepClosed : predictionStep
  updateStepClosed : updateStep
  forwardAlgorithmClosed : forwardAlgorithm

structure FilteringEvidence (F : FilteringRecursion) where
  predictionStepClosed : F.predictionStepClosed
  updateStepClosed : F.updateStepClosed
  forwardAlgorithmClosed : F.forwardAlgorithmClosed

def FilteringClosed (F : FilteringRecursion) : Prop :=
  F.predictionStepClosed ∧ F.updateStepClosed ∧ F.forwardAlgorithmClosed

theorem filtering_closed_from_evidence (F : FilteringRecursion) (E : FilteringEvidence F) :
    FilteringClosed F := by
  exact And.intro E.predictionStepClosed
    (And.intro E.updateStepClosed E.forwardAlgorithmClosed)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse