class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :email
      t.string :empresa
      t.string :instituicao

      t.timestamps
    end
  end
end
