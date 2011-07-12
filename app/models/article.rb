class Article < ActiveRecord::Base
	belongs_to :author, :class_name => "User"
	belongs_to :category
#	has_many :comments, :dependent => :destroy

	validates_presence_of :title, :content, :author_id, :category_id
	acts_as_taggable
#	acts_as_taggable_on :tags
	
	has_friendly_id :title, :use_slug => true
	
	scope :published, where(:draft => false)
	scope :drafts, where(:draft => true)
end
