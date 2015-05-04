class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nome
      t.integer :vagas

      t.timestamps
    end
  end
end
