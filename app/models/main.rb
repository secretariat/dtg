require 'digest/sha1'

class Main < ActiveRecord::Base
  has_one :admin
  has_one :manager
  has_one :user
  
  attr_accessible :login, :hash_pass, :hash_salt, :owner_id, :priv_level, :password
  
  attr_accessor :password
  attr_accessor :email

  validates_uniqueness_of :login, :message => "already exists"
  validates_length_of :password, :within => 5..32, :on => :create
  

  before_save :create_hashed_password
  after_save :clear_password

  #######################################################
  #######################################################
  def self.authenticate(login="", password="")
    main = Main.find_by_login(login)
    if main && main.password_match?(password)
      return main
    else
      return false
    end
  end
  #######################################################
  #######################################################
	def password_match?(password="")
    hash_pass == Main.hash_with_salt(password, hash_salt)
  end
	#######################################################
  #######################################################

  def self.make_salt(login="")
    Digest::SHA1.hexdigest("#{login}#{Time.now}")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("#{salt}#{password}")
  end



 # #  #######################################################
 # #  #######################################################
  private
  
  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.hash_salt = Main.make_salt(login) if hash_salt.blank?
      self.hash_pass = Main.hash_with_salt(password, hash_salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end


end
