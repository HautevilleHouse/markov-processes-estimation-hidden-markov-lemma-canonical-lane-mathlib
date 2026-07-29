import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.HiddenMarkovLemmaStatement

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure EstimationConvergencePackage {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F} where
  convergenceRate : ℝ
  asymptoticNormality : Prop
  consistency : Prop
  efficiency : Prop
  mEstimator : Prop

structure EstimationConvergenceEvidence {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F}
    (E : EstimationConvergencePackage H F L) where
  asymptoticNormalityClosed : E.asymptoticNormality
  consistencyClosed : E.consistency
  efficiencyClosed : E.efficiency
  mEstimatorClosed : E.mEstimator

def EstimationConvergenceClosed {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F}
    (E : EstimationConvergencePackage H F L) : Prop :=
  E.asymptoticNormality ∧ E.consistency ∧ E.efficiency ∧ E.mEstimator

theorem estimation_convergence_closed_from_evidence {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F}
    (E : EstimationConvergencePackage H F L) (Ev : EstimationConvergenceEvidence E) :
    EstimationConvergenceClosed E := by
  exact And.intro Ev.asymptoticNormalityClosed
    (And.intro Ev.consistencyClosed (And.intro Ev.efficiencyClosed Ev.mEstimatorClosed))

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse