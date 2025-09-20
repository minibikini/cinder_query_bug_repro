defmodule CinderQueryBugRepro.MyDomain.MyResource do
  use Ash.Resource,
    otp_app: :cinder_query_bug_repro,
    domain: CinderQueryBugRepro.MyDomain,
    data_layer: AshSqlite.DataLayer

  sqlite do
    table "my_resources"
    repo CinderQueryBugRepro.Repo
  end

  actions do
    defaults [:read, create: [:number, :is_active]]
  end

  attributes do
    uuid_primary_key :id

    attribute :number, :integer do
      allow_nil? false
      public? true
    end

    attribute :is_active, :boolean do
      allow_nil? false
      public? true
    end
  end
end
