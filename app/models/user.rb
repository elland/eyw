class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me
	has_many :articles, :as => :author
#	has_many :comments

	validates_presence_of :name
#	has_friendly_id :name, :use_slug => true

	acts_as_tagger
	attr_accessible :roles, :name
	
	ROLES = %w[admin author moderator banned]

	def roles_list
		ROLES.each do |e| e.capitalize! end
	end

	def roles=(roles)
		self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
	end

	def roles
		ROLES.reject do |r|
			((roles_mask || 0) & 2**ROLES.index(r)).zero?
		end
	end
	
	def is?(role)
		roles.include?(role.to_s)
	end
	
	def method_missing(id, *args)
		return is?(Regexp.last_match(1)) if id.id2name =~ /is_(.+)/
		super
	end
end
