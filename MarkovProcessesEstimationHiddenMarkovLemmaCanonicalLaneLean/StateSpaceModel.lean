import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure StateSpaceModel where
  stateSpace : Type u
  observationSpace : Type v
  transitionKernel : stateSpace → Set (stateSpace × stateSpace)
  emissionKernel : stateSpace → Set (observationSpace × observationSpace)
  initialDistribution : Set stateSpace
  markovProperty : Prop
  stationaryTransition : Prop
  initialDistributionClosed : initialDistribution.Nonempty
  markovPropertyClosed : markovProperty
  stationaryTransitionClosed : stationaryTransition

structure StateSpaceEvidence (S : StateSpaceModel) where
  initialDistributionClosed : S.initialDistributionClosed
  markovPropertyClosed : S.markovPropertyClosed
  stationaryTransitionClosed : S.stationaryTransitionClosed

def StateSpaceClosed (S : StateSpaceModel) : Prop :=
  S.initialDistributionClosed ∧ S.markovPropertyClosed ∧ S.stationaryTransitionClosed

theorem state_space_closed_from_evidence (S : StateSpaceModel) (E : StateSpaceEvidence S) :
    StateSpaceClosed S := by
  exact And.intro E.initialDistributionClosed
    (And.intro E.markovPropertyClosed E.stationaryTransitionClosed)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse