import canonoicalLaneMathlib.AdmissibleClass
import MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.StateSpaceModel
import MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.FilteringRecursion
import MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.HiddenMarkovLemma

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

def ConstrainedMarkovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_endgame (A : AdmissibleClass) :
    ConstrainedMarkovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse