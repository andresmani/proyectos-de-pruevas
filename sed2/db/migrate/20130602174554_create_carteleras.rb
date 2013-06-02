class CreateCarteleras < ActiveRecord::Migration
  def change
    create_table :carteleras do |t|
      t.text :mensaje

      t.timestamps
    end
  end
end
