import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure HiddenMarkovLemmaPackage where
  filterRecursion : Prop
  predictorRecursion : Prop
  likelihoodComputation : Prop
  filterRecursionClosed : filterRecursion
  predictorRecursionClosed : predictorRecursion
  likelihoodComputationClosed : likelihoodComputation

def HiddenMarkovLemmaClosed (H : HiddenMarkovLemmaPackage) : Prop :=
  H.filterRecursion ∧ H.predictorRecursion ∧ H.likelihoodComputation

theorem hidden_markov_lemma_closed_from_evidence (H : HiddenMarkovLemmaPackage)
    (E : filterRecursionClosed H ∧ predictorRecursionClosed H ∧ likelihoodComputationClosed H) :
    HiddenMarkovLemmaClosed H := by
  exact And.intro E.1 (And.intro E.2.1 E.2.2)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse