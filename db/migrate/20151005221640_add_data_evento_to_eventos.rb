class AddDataEventoToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :data_evento, :date
  end
end
