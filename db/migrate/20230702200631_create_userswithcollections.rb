class CreateUserswithcollections < ActiveRecord::Migration[7.0]
  def change
    create_table :userswithcollections do |t|
      t.belongs_to :collection, null: false, foreign_key: true
      t.belongs_to :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
