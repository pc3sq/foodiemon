class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.belongs_to :foody

      t.timestamps
    end
  end
end
