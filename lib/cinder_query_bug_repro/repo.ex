defmodule CinderQueryBugRepro.Repo do
  use AshSqlite.Repo,
    otp_app: :cinder_query_bug_repro
end
