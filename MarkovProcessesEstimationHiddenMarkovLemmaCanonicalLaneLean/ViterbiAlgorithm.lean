import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.HiddenMarkovModel

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure ViterbiPath (M : HiddenMarkovModel) where
  observationSequence : List M.observationSpace
  mostLikelyStateSequence : List M.stateSpace
  pathProbability : ℝ

def ViterbiPathClosed {M : HiddenMarkovModel} (V : ViterbiPath M) : Prop :=
  V.observationSequence.length = V.mostLikelyStateSequence.length ∧
  0 ≤ V.pathProbability

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse
