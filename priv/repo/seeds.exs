alias DemoApp.Repo
alias DemoApp.Practitioner

Repo.delete_all(Practitioner)

for name <- ["Martin", "Ola", "Kari"] do
  Repo.insert(%Practitioner{name: name})
end
