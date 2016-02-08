class AddComment3ToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :comment3, :string
  end
end
