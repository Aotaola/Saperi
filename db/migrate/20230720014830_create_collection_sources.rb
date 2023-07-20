class CreateCollectionSources < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_sources do |t|
      t.belongs_to :source, null: false, foreign_key: true
      t.belongs_to :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
