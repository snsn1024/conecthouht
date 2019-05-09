class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.integer :post_id
    	t.string :post_title
    	t.text :post_text
    	t.text :post_image
    	t.text :post_sound
    	t.integer :user_id
    	t.integer :gunre_id

      t.timestamps
    end
  end
end
