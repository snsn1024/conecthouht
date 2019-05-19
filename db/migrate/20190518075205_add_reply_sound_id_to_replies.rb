class AddReplySoundIdToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :reply_sound_id, :string
  end
end
