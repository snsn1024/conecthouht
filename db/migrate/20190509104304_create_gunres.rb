class CreateGunres < ActiveRecord::Migration[5.2]
  def change
    create_table :gunres do |t|
    	t.integer :gunre_id
    	t.string :gunre_name

      t.timestamps
    end
  end
end
