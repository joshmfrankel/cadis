class AccountRepository < Hanami::Repository
  associations do
    has_many :projects
  end
end
