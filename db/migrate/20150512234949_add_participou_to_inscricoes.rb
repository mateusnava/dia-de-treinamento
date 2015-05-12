class AddParticipouToInscricoes < ActiveRecord::Migration
  def change
    add_column :inscricoes, :participou, :boolean, default: true, null: false
  end
end
