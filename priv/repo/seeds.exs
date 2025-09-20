for i <- 1..10 do
  Ash.Seed.seed!(CinderQueryBugRepro.MyDomain.MyResource, %{
    number: i,
    is_active: rem(i, 2) == 0
  })
end
