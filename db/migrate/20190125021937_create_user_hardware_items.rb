class CreateUserHardwareItems < ActiveRecord::Migration[5.2]
  def change
    create_table :user_hardware_items do |t|
      t.references :user, foreign_key: true
      t.references :hardware_item, foreign_key: true

      t.timestamps
    end
  end
end
