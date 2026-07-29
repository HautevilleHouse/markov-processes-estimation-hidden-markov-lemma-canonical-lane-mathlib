import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure HiddenMarkovModel where
  stateSpace : Type u
  observationSpace : Type v
  transitionMatrix : stateSpace → stateSpace → ℝ
  emissionMatrix : stateSpace → observationSpace → ℝ
  initialDistribution : stateSpace → ℝ

def HiddenMarkovModelClosed (M : HiddenMarkovModel) : Prop :=
  (∀ s, 0 ≤ M.initialDistribution s) ∧
  (∑' s, M.initialDistribution s = 1) ∧
  (∀ s, 0 ≤ ∑' t, M.transitionMatrix s t) ∧
  (∀ s, 0 ≤ ∑' o, M.emissionMatrix s o)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse
