class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :first_member, class_name: 'User'
  belongs_to :second_member, class_name: 'User'

  scope :between, lambda { |member, other_member|
    where(first_member: member, second_member: other_member)
      .or(where(first_member: other_member, second_member: member))
  }
end
