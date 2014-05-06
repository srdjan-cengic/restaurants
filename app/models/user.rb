class User < ActiveRecord::Base
	has_one :restaurant, foreign_key: "owner_id"
	belongs_to :role
	# Authentication logic inside User model(2 methods, encrypt_password, authenticate)
	# WHY FROM SCRATCH? BECAUSE YOU WANT TO FULLY UNDERSTAN WHAT IS HAPPENING UNDER THE HOOD.
	# You can prosiriti ovo sa:
	# email validacijom, dodati username

	############################################## CALLBACKS ###############################################
	#Callbacks are methods that get called at certain moments of an object's life cycle. 
	# With callbacks it is possible to write code that will run whenever an Active Record object is 
	# created, saved, updated, deleted, validated, or loaded from the database.
	# SO, Callbacks allow you to trigger logic before or after an alteration of an object's state.
	before_save :encrypt_password
	#########################################################################################################

	################################## Virtual attributes and validations ###################################
	# This validation creates a virtual attribute whose name is the name of the field that has to be 
	# confirmed with "_confirmation" appended. You should use confirmation helper when you have two 
	# text fields that should receive exactly the same content.
	
	attr_accessor :password # virtualni atribut, get & set za password
	validates :password, confirmation: true # ovo ce automatski napravit get & set za password_confirmation
	validates :password, length: { in: 6..20 }, on: :update, allow_blank: true

	# By default, the validations run for both create and update. 
    # The :on key just allows you to choose one of them.
    validates :password, presence: true, on: :create

	validates :email, presence: true
	validates :email, uniqueness: true
	#########################################################################################################

	def encrypt_password
		#puts "self.password: " + self.password # accessor method
		#puts "self.password_confirmation: " + self.password_confirmation
		# puts "self.password_salt: " + self.password_salt => ERROR: can't convert nil into String

		# self is the instance inside of an instance method.
		# .nil? .empty? .blank? .present? in Ruby on Rails
			# .nil? = It can be used on any object and is true if the object is nil.
			# nil.nil? = true | a = nil; a.nil? = true | “”.nil = false | anthing_else.nil? = false

			#.empty? = can be used on strings, arrays and hashes and returns true if:
				# String length == 0 | Array length == 0 | Hash length == 0
				# "".empty = true, ali " ".empty? = false

			# .blank? operate on any object as well as work like .empty? on strings, arrays and hashes.
			# An object is blank if it's false, empty, or a whitespace string
			# nil.blank? = true | [].blank? = true | {}.blank? = true | "".blank? = true | 5.blank? == false
			# address.nil? || address.empty? <=> address.blank?

			#def present? 
 				#!blank?
			#end
		if self.password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(self.password, self.password_salt)
		end
	end

	def self.authenticate(email, password)
		user = User.find_by_email(email)

		# First you need to see that user exist
		if user && BCrypt::Engine.hash_secret(password, user.password_salt) == user.password_hash
			user
		else
			nil
		end
	end

	
end