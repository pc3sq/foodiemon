class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :url
      t.belongs_to :gallery

      t.timestamps
    end
  end
end
