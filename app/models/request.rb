class Request < ApplicationRecord
  before_create :confirmation_token
  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true
  validates :phone_number, presence: true, format: { with: /\A0\d{9}$\z/ }
  validates :bio, presence: true, length: { minimum: 7 }


  def self.unconfirmed
    Request.where(status: "unconfirmed")
  end

  def self.confirmed
    Request.where(status: "confirmed")
  end

  def self.accepted
    Request.where(status: "accepted")
  end

  def self.expired
    Request.where(status: "expired")
  end

  def accept!
    self.update(status: "accepted")
  end

  def email_confirmed!
    self.update(status: "confirmed")
  end


private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end


end
