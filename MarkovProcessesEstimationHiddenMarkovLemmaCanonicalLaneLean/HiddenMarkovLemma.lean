import canonoicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure HiddenMarkovLemma where
  stateSpaceModel : StateSpaceModel
  filteringRecursion : FilteringRecursion
  estimationConsistency : Prop
  hiddenMarkovProperty : Prop
  estimationConsistencyClosed : estimationConsistency
  hiddenMarkovPropertyClosed : hiddenMarkovProperty

structure HiddenMarkovEvidence (H : HiddenMarkovLemma) where
  estimationConsistencyClosed : H.estimationConsistencyClosed
  hiddenMarkovPropertyClosed : H.hiddenMarkovPropertyClosed

def HiddenMarkovClosed (H : HiddenMarkovLemma) : Prop :=
  H.estimationConsistencyClosed ∧ H.hiddenMarkovPropertyClosed

theorem hidden_markov_closed_from_evidence (H : HiddenMarkovLemma) (E : HiddenMarkovEvidence H) :
    HiddenMarkovClosed H := by
  exact And.intro E.estimationConsistencyClosed E.hiddenMarkovPropertyClosed

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse