class AddInstrumentToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :instrument, :text
  end
end
