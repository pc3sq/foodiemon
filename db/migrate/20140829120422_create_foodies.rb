class CreateFoodies < ActiveRecord::Migration
  def change
    create_table :foodies do |t|
      t.string :name

      t.timestamps
    end
  end
end
