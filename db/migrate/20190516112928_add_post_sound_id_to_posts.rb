class AddPostSoundIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_sound_id, :string
  end
end
