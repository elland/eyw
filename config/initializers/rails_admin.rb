RailsAdmin.config do |config|
	config.model Article do
		[create, edit].each do
			group :default do
				field :title
				field :content, :text do
					ckeditor true
				end
				field :category_id
			end
		end
	end
	
	config.model User do
		[create, edit].each do
			field :name
			field :email
			field :password
			field :password_confirmation
			field :roles, :enum do
				enum_method do
					:roles_list
				end
			end
		end
	end
end