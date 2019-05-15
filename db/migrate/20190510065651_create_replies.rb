class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
    	t.integer :reply_id
    	t.string :reply_title
    	t.text :reply_text
    	t.text :reply_image
    	t.text :reply_sound
    	t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
