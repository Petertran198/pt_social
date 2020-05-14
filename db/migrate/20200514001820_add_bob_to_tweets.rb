class AddBobToTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :length
  end
end
