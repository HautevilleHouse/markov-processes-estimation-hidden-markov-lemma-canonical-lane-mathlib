import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.ForwardBackwardAlgorithm

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure BaumWelchUpdate (M : HiddenMarkovModel) where
  expectedTransitionCounts : M.stateSpace → M.stateSpace → ℝ
  expectedEmissionCounts : M.stateSpace → M.observationSpace → ℝ
  updatedTransitionMatrix : M.stateSpace → M.stateSpace → ℝ
  updatedEmissionMatrix : M.stateSpace → M.observationSpace → ℝ
  updatedInitialDistribution : M.stateSpace → ℝ
  convergenceCriterion : Prop

structure BaumWelchEvidence {M : HiddenMarkovModel} (B : BaumWelchUpdate M) where
  transitionCountsNonnegative : ∀ s t, 0 ≤ B.expectedTransitionCounts s t
  emissionCountsNonnegative : ∀ s o, 0 ≤ B.expectedEmissionCounts s o
  updatedMatricesStochastic : (∀ s, ∑' t, B.updatedTransitionMatrix s t = 1) ∧ (∀ s, ∑' o, B.updatedEmissionMatrix s o = 1)
  convergenceCriterionClosed : B.convergenceCriterion

def BaumWelchClosed {M : HiddenMarkovModel} (B : BaumWelchUpdate M) : Prop :=
  (∀ s t, 0 ≤ B.expectedTransitionCounts s t) ∧
  (∀ s o, 0 ≤ B.expectedEmissionCounts s o) ∧
  (∀ s, ∑' t, B.updatedTransitionMatrix s t = 1) ∧
  (∀ s, ∑' o, B.updatedEmissionMatrix s o = 1) ∧
  B.convergenceCriterion

theorem baum_welch_closed_from_evidence {M : HiddenMarkovModel}
    (B : BaumWelchUpdate M) (E : BaumWelchEvidence B) : BaumWelchClosed B := by
  exact And.intro E.transitionCountsNonnegative
    (And.intro E.emissionCountsNonnegative
      (And.intro E.updatedMatricesStochastic.left
        (And.intro E.updatedMatricesStochastic.right E.convergenceCriterionClosed)))

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse
