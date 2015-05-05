class CreateInscricoes < ActiveRecord::Migration
  def change
    create_table :inscricoes do |t|
      t.references :pessoa, index: true
      t.references :evento, index: true

      t.timestamps
    end
  end
end
