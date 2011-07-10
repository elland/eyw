class Article < ActiveRecord::Base
	belongs_to :author, :class_name => "User"
	belongs_to :category
	has_and_belongs_to_many :tags
	has_many :comments
	
	has_friendly_id :title, :use_slug => true
end
