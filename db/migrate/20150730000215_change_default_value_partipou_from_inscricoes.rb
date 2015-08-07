class ChangeDefaultValuePartipouFromInscricoes < ActiveRecord::Migration
  def change
    change_column :inscricoes, :participou, :boolean, default: false, null: false
  end
end
