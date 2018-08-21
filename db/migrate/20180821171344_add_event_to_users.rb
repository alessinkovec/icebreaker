class AddEventToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :event, foreign_key: true, default: nil
  end
end
