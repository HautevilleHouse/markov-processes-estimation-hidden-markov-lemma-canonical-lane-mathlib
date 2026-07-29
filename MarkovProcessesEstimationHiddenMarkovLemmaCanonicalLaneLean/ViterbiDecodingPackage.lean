import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

structure ViterbiDecodingPackage where
  maxLikelihoodPathExists : Prop
  dynamicProgrammingUsed : Prop
  backtrackingCorrect : Prop
  maxLikelihoodPathExistsClosed : maxLikelihoodPathExists
  dynamicProgrammingUsedClosed : dynamicProgrammingUsed
  backtrackingCorrectClosed : backtrackingCorrect

def ViterbiDecodingClosed (V : ViterbiDecodingPackage) : Prop :=
  V.maxLikelihoodPathExists ∧ V.dynamicProgrammingUsed ∧ V.backtrackingCorrect

theorem viterbi_decoding_closed_from_evidence (V : ViterbiDecodingPackage)
    (E : maxLikelihoodPathExistsClosed V ∧ dynamicProgrammingUsedClosed V ∧ backtrackingCorrectClosed V) :
    ViterbiDecodingClosed V := by
  exact And.intro E.1 (And.intro E.2.1 E.2.2)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse