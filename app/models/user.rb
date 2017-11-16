require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :encrypted_password, Text
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
  	@password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
end
