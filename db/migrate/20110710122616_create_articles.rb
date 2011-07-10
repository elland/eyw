class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :cached_slug
      t.string :content
      t.integer :author_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
