class AddComment2ToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :comment2, :string
  end
end
