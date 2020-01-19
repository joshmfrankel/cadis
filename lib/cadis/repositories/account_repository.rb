class AccountRepository < Hanami::Repository
  associations do
    has_many :projects
    has_many :users
  end

  def create_with_users(data)
    assoc(:users).create(data)
  end
end
