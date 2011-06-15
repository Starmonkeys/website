class User < ActiveRecord::Base
  has_many :projects, :as => :author
  has_many :use_cases, :as => :author
  has_many :tasks, :as => :author
  has_many :tasks, :as => :owner
  has_many :comments, :as => :author

  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessor :password

  before_save :encrypt_password

  validates_presence_of :username, :email
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates_uniqueness_of :username, :email
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
