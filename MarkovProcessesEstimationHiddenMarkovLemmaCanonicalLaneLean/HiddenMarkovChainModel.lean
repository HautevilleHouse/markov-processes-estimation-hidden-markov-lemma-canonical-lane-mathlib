import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure HiddenStateSpace where
  stateType : Type u
  transitionMatrix : Type v
  emissionMatrix : Type w
  finiteCarrier : Prop
  finiteCarrierTerm : finiteCarrier

def HiddenStateSpaceClosed (S : HiddenStateSpace) : Prop :=
  S.finiteCarrier

structure ObservationSpace where
  observationType : Type u
  finiteObservationSet : Prop
  observationLikelihood : Prop
  finiteObservationSetTerm : finiteObservationSet
  observationLikelihoodTerm : observationLikelihood

def ObservationSpaceClosed (O : ObservationSpace) : Prop :=
  O.finiteObservationSet ∧ O.observationLikelihood

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse