import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure HiddenMarkovModelPackage where
  stateSpace : Type u
  observationSpace : Type v
  transitionKernel : stateSpace → stateSpace → ℝ
  emissionKernel : stateSpace → observationSpace → ℝ
  initialDistribution : stateSpace → ℝ
  stationarity : Prop
  markovProperty : Prop
  initialDistributionNormalized : Prop
  transitionKernelNormalized : Prop
  emissionKernelNormalized : Prop

structure HiddenMarkovModelEvidence (H : HiddenMarkovModelPackage) where
  stationarityClosed : H.stationarity
  markovPropertyClosed : H.markovProperty
  initialDistributionNormalizedClosed : H.initialDistributionNormalized
  transitionKernelNormalizedClosed : H.transitionKernelNormalized
  emissionKernelNormalizedClosed : H.emissionKernelNormalized

def HiddenMarkovModelClosed (H : HiddenMarkovModelPackage) : Prop :=
  H.stationarity ∧ H.markovProperty ∧ H.initialDistributionNormalized ∧
  H.transitionKernelNormalized ∧ H.emissionKernelNormalized

theorem hidden_markov_model_closed_from_evidence (H : HiddenMarkovModelPackage)
    (E : HiddenMarkovModelEvidence H) : HiddenMarkovModelClosed H := by
  exact And.intro E.stationarityClosed
    (And.intro E.markovPropertyClosed
      (And.intro E.initialDistributionNormalizedClosed
        (And.intro E.transitionKernelNormalizedClosed E.emissionKernelNormalizedClosed)))

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse