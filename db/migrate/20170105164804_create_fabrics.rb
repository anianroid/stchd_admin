class CreateFabrics < ActiveRecord::Migration
  def change
    create_table :fabrics do |t|
      t.integer :fid
      t.string :name
      t.float :thread_count
      t.string :type
      t.integer :quantity
      t.string :color

      t.timestamps null: false
    end
  end
end
