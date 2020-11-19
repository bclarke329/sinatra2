class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :current_condition
      t.boolean :new_products
      t.string :list_products
      t.string :comments
      t.integer :user_id
      t.timestamps 
    end
  end
end
