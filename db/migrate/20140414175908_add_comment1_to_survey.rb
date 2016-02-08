class AddComment1ToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :comment1, :string
  end
end
