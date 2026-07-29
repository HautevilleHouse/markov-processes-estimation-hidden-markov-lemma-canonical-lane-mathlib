import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.EstimationConvergence

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure FilteringAndSmoothingPackage {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F}
    {E : EstimationConvergencePackage H F L} where
  filterRecursion : Prop
  smootherRecursion : Prop
  fixedLagSmoothing : Prop
  particleFilterConsistency : Prop
  kalmanFilterVariant : Prop

structure FilteringAndSmoothingEvidence {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F}
    {E : EstimationConvergencePackage H F L}
    (S : FilteringAndSmoothingPackage H F L E) where
  filterRecursionClosed : S.filterRecursion
  smootherRecursionClosed : S.smootherRecursion
  fixedLagSmoothingClosed : S.fixedLagSmoothing
  particleFilterConsistencyClosed : S.particleFilterConsistency
  kalmanFilterVariantClosed : S.kalmanFilterVariant

def FilteringAndSmoothingClosed {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F}
    {E : EstimationConvergencePackage H F L}
    (S : FilteringAndSmoothingPackage H F L E) : Prop :=
  S.filterRecursion ∧ S.smootherRecursion ∧ S.fixedLagSmoothing ∧
  S.particleFilterConsistency ∧ S.kalmanFilterVariant

theorem filtering_and_smoothing_closed_from_evidence {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} {L : HiddenMarkovLemmaPackage H F}
    {E : EstimationConvergencePackage H F L}
    (S : FilteringAndSmoothingPackage H F L E) (Ev : FilteringAndSmoothingEvidence S) :
    FilteringAndSmoothingClosed S := by
  exact And.intro Ev.filterRecursionClosed
    (And.intro Ev.smootherRecursionClosed
      (And.intro Ev.fixedLagSmoothingClosed
        (And.intro Ev.particleFilterConsistencyClosed Ev.kalmanFilterVariantClosed)))

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse