class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
