import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.HiddenMarkovModelState

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure ViterbiPackage (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) where
  mostLikelyPath : List H.stateSpace
  pathProbability : ℝ
  dynamicProgrammingRecursion : Prop
  optimalSubstructure : Prop
  pathRecovery : Prop

structure ViterbiEvidence (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) (V : ViterbiPackage H O) where
  dynamicProgrammingRecursionClosed : V.dynamicProgrammingRecursion
  optimalSubstructureClosed : V.optimalSubstructure
  pathRecoveryClosed : V.pathRecovery

def ViterbiClosed (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) (V : ViterbiPackage H O) : Prop :=
  V.dynamicProgrammingRecursion ∧ V.optimalSubstructure ∧ V.pathRecovery

theorem viterbi_closed_from_evidence (H : HiddenMarkovStateSpace) (O : HiddenMarkovObservationSequence) (V : ViterbiPackage H O) (E : ViterbiEvidence H O V) :
    ViterbiClosed H O V := by
  exact And.intro E.dynamicProgrammingRecursionClosed (And.intro E.optimalSubstructureClosed E.pathRecoveryClosed)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse