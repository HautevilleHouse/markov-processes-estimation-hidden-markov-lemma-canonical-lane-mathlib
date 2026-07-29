import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.HiddenMarkovModelStructure

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure ForwardBackwardPackage {H : HiddenMarkovModelPackage} where
  forwardAlgorithm : Type u
  backwardAlgorithm : Type v
  forwardRecurrence : Prop
  backwardRecurrence : Prop
  scalingFactor : Prop
  numericalStability : Prop

structure ForwardBackwardEvidence {H : HiddenMarkovModelPackage} (F : ForwardBackwardPackage H) where
  forwardRecurrenceClosed : F.forwardRecurrence
  backwardRecurrenceClosed : F.backwardRecurrence
  scalingFactorClosed : F.scalingFactor
  numericalStabilityClosed : F.numericalStability

def ForwardBackwardClosed {H : HiddenMarkovModelPackage} (F : ForwardBackwardPackage H) : Prop :=
  F.forwardRecurrence ∧ F.backwardRecurrence ∧ F.scalingFactor ∧ F.numericalStability

theorem forward_backward_closed_from_evidence {H : HiddenMarkovModelPackage}
    (F : ForwardBackwardPackage H) (E : ForwardBackwardEvidence F) : ForwardBackwardClosed F := by
  exact And.intro E.forwardRecurrenceClosed
    (And.intro E.backwardRecurrenceClosed
      (And.intro E.scalingFactorClosed E.numericalStabilityClosed))

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse