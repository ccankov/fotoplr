class CreateCameras < ActiveRecord::Migration[5.0]
  def change
    create_table :cameras do |t|
      t.string :mac, null: false
      t.string :ip, null: false
      t.timestamps
    end

    add_index :cameras, :mac, unique: true
    add_index :cameras, :ip, unique: true
  end
end
