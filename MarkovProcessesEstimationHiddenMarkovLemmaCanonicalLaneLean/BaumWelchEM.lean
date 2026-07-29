import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.ForwardBackwardAlgorithm

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure BaumWelchPackage (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) where
  updatedTransitionKernel : H.stateSpace → H.stateSpace → ℝ
  updatedEmissionKernel : H.stateSpace → H.observationSpace → ℝ
  updatedInitialDistribution : H.stateSpace → ℝ
  expectationStep : Prop
  maximizationStep : Prop
  likelihoodNonDecreasing : Prop
  fixedPointProperty : Prop

structure BaumWelchEvidence (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) (B : BaumWelchPackage H O) where
  expectationStepClosed : B.expectationStep
  maximizationStepClosed : B.maximizationStep
  likelihoodNonDecreasingClosed : B.likelihoodNonDecreasing
  fixedPointPropertyClosed : B.fixedPointProperty

def BaumWelchClosed (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) (B : BaumWelchPackage H O) : Prop :=
  B.expectationStep ∧ B.maximizationStep ∧ B.likelihoodNonDecreasing ∧ B.fixedPointProperty

theorem baum_welch_closed_from_evidence (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) (B : BaumWelchPackage H O) (E : BaumWelchEvidence H O B) :
    BaumWelchClosed H O B := by
  exact And.intro E.expectationStepClosed (And.intro E.maximizationStepClosed (And.intro E.likelihoodNonDecreasingClosed E.fixedPointPropertyClosed))

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse