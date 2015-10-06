class AddSlugToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :slug, :string
  end
end
