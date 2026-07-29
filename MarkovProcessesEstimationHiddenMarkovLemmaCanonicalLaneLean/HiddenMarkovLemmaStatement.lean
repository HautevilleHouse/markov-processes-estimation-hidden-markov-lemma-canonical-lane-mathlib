import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean.ForwardBackwardAlgorithm

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure HiddenMarkovLemmaPackage {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} where
  posteriorDistribution : Prop
  marginalLikelihood : Prop
  viterbiPath : Prop
  conditionalIndependence : Prop
  smoothingRelation : Prop

structure HiddenMarkovLemmaEvidence {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} (L : HiddenMarkovLemmaPackage H F) where
  posteriorDistributionClosed : L.posteriorDistribution
  marginalLikelihoodClosed : L.marginalLikelihood
  viterbiPathClosed : L.viterbiPath
  conditionalIndependenceClosed : L.conditionalIndependence
  smoothingRelationClosed : L.smoothingRelation

def HiddenMarkovLemmaClosed {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} (L : HiddenMarkovLemmaPackage H F) : Prop :=
  L.posteriorDistribution ∧ L.marginalLikelihood ∧ L.viterbiPath ∧
  L.conditionalIndependence ∧ L.smoothingRelation

theorem hidden_markov_lemma_closed_from_evidence {H : HiddenMarkovModelPackage}
    {F : ForwardBackwardPackage H} (L : HiddenMarkovLemmaPackage H F)
    (E : HiddenMarkovLemmaEvidence L) : HiddenMarkovLemmaClosed L := by
  exact And.intro E.posteriorDistributionClosed
    (And.intro E.marginalLikelihoodClosed
      (And.intro E.viterbiPathClosed
        (And.intro E.conditionalIndependenceClosed E.smoothingRelationClosed)))

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse