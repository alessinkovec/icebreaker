class Chat < ApplicationRecord
  after_create :notify_pusher, on: :create
  belongs_to :event

  def notify_pusher
    Pusher.trigger('chat', 'new', self.as_json)
  end
end
