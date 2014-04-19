class AddVoteToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :vote, :int
  end
end
