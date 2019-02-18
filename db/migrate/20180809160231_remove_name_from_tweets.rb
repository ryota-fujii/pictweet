class RemoveNameFromTweets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tweets, :name, :string
  end
end
