# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  emergency_id :integer
#  text         :text
#  claim_closed :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_messages_on_emergency_id  (emergency_id)
#  index_messages_on_user_id       (user_id)
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is not valid without a text" do 
  	message = Message.new
  	expect(message).not_to be_valid
  end

   it "is not valid with a text longer than 100" do 
  	message = Message.new(text: 'a' * 101)
  	expect(message).to be_valid
  end

end
