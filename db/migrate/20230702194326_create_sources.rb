class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
      t.string :description
      t.string :link
      t.belongs_to :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
