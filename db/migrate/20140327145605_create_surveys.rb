class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :level
      t.integer :years

      t.timestamps
    end
  end
end
