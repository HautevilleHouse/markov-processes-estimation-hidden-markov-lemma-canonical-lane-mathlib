import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.smoothingDistributionComputed ∧ A.object.filteringRecursionValid ∧ A.object.maximizationStepConverges

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  And.intro A.object.smoothingDistributionComputed (And.intro A.object.filteringRecursionValid A.object.maximizationStepConverges)

end MarkovProcessesEstimationHiddenMarkovLemmaCanonicalLaneLean
end HautevilleHouse