class Request < ApplicationRecord

  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true
  validates :phone_number, presence: true, format: { with: /\A0\d{9}$\z/ }
  validates :bio, presence: true, length: { minimum: 20 }

  def accept!
    self.update(status: "accepted")
  end



end
