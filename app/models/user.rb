require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, Text, :required => true, :unique => true
  property :encrypted_password, Text
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
  	@password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.encrypted_password) == password
      # return this user
      user
    else
      nil
    end
  end

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address
end
