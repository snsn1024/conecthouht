class AddReplyImageIdToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :reply_image_id, :string
  end
end
