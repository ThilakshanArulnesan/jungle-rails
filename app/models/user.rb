class User < ActiveRecord::Base
  #uses bcrypt for authentication
  has_secure_password
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  # validates :password, confirmation: { case_sensitive: true }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :password,  length: { minimum: 6 }

  # private

  def self.authenticate_with_credentials(email, pass)
    email.gsub!(/\s+/, "")
    # user = self.find_by_email(email)
    users = self.where("LOWER(email) ILIKE ?", email)

    # p user[0]

    if users[0] && users[0].authenticate(pass)

      return users[0];
    else
      return nil;
    end

  end
end
