class AddStuffToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :length, :integer
  end
end
