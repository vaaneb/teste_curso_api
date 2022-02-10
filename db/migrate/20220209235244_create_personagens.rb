class CreatePersonagens < ActiveRecord::Migration[7.0]
  def change
    create_table :personagens do |t|
      t.string :name, null:false

      t.timestamps
    end
  end
end
