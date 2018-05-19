class AddUsersToConversations < ActiveRecord::Migration[5.2]
  def change
    add_reference :conversations, :first_member, foreign_key: { to_table: :user }
    add_reference :conversations, :second_member, foreign_key: { to_table: :user }
  end
end
