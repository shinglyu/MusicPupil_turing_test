class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :survey_id
      t.integer :qid
      t.string :ans

      t.timestamps
    end
  end
end
