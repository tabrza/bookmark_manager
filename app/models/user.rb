require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :encrypted_password, Text

  def password(new_password)
    self.encrypted_password = BCrypt::Password.create(new_password)
  end

end
