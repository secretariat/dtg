# -*- encoding : utf-8 -*-
require 'digest/sha1'

class Main < ActiveRecord::Base
  has_one :admin,  :dependent => :destroy
  has_one :manager,  :dependent => :destroy
  has_one :user,  :dependent => :destroy

  validates_associated :admin
  validates_associated :manager
  validates_associated :user
  
  attr_accessible :login, :hash_pass, :hash_salt, :owner_id, :priv_level, :password
  
  attr_accessor :password

  validates_uniqueness_of :login, :message => ": Пользователь с таким Логином уже существует"
  validates_length_of :password, :within => 6..32, :on => :create
  

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
