defmodule CinderQueryBugRepro.MyDomain do
  use Ash.Domain,
    otp_app: :cinder_query_bug_repro

  resources do
    resource CinderQueryBugRepro.MyDomain.MyResource
  end
end
