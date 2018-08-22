class AddEventToChats < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :event, foreign_key: true
  end
end
