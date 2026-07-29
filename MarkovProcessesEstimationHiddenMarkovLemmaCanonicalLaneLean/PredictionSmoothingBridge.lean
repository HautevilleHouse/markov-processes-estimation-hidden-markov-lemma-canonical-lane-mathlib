import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure PredictionSmoothingBridge where
  oneStepPrediction : Prop
  fixedIntervalSmoothing : Prop
  bridgeConsistency : Prop
  oneStepPredictionClosed : oneStepPrediction
  fixedIntervalSmoothingClosed : fixedIntervalSmoothing
  bridgeConsistencyClosed : bridgeConsistency

def PredictionSmoothingBridgeClosed (B : PredictionSmoothingBridge) : Prop :=
  B.oneStepPrediction ∧ B.fixedIntervalSmoothing ∧ B.bridgeConsistency

theorem prediction_smoothing_bridge_closed_from_evidence (B : PredictionSmoothingBridge)
    (E : oneStepPredictionClosed B ∧ fixedIntervalSmoothingClosed B ∧ bridgeConsistencyClosed B) :
    PredictionSmoothingBridgeClosed B := by
  exact And.intro E.1 (And.intro E.2.1 E.2.2)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse