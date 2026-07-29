import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure HiddenMarkovStateSpace where
  stateSpace : Type u
  observationSpace : Type v
  transitionKernel : stateSpace → stateSpace → ℝ
  emissionKernel : stateSpace → observationSpace → ℝ
  initialDistribution : stateSpace → ℝ
  transitionKernelProps : Prop
  emissionKernelProps : Prop
  initialDistributionProps : Prop

structure HiddenMarkovObservationSequence where
  observations : List observationSpace
  length : ℕ
  observationsProps : length = observations.length

structure HiddenMarkovEvidence (H : HiddenMarkovStateSpace) where
  transitionKernelClosed : H.transitionKernelProps
  emissionKernelClosed : H.emissionKernelProps
  initialDistributionClosed : H.initialDistributionProps

def HiddenMarkovStateClosed (H : HiddenMarkovStateSpace) : Prop :=
  H.transitionKernelProps ∧ H.emissionKernelProps ∧ H.initialDistributionProps

theorem hidden_markov_state_closed_from_evidence (H : HiddenMarkovStateSpace) (E : HiddenMarkovEvidence H) :
    HiddenMarkovStateClosed H := by
  exact And.intro E.transitionKernelClosed (And.intro E.emissionKernelClosed E.initialDistributionClosed)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse