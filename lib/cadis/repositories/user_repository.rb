class UserRepository < Hanami::Repository
  associations do
    belongs_to :account
  end

  def find_with_account(id)
    aggregate(:account).where(id: id).map_to(User).one
  end

  def find_by_email(email)
    users.where(email: email).one
  end

  def find_by_id_and_confirmation_token(id:, confirmation_token:)
    users.where(id: id, confirmation_token: confirmation_token).one
  end
end
