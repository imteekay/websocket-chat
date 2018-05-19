class BroadcastMessage
  attr_reader :message

  def self.call(message)
    new(message).call
  end

  def initialize(message)
    @message = message
  end

  def call
    ActionCable.server.broadcast 'messages',
      message: message_content,
      user: username
  end

  private

  def message_content
    message.content
  end

  def username
    message.user.username
  end
end
