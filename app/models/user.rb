class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { client: 0, professional: 1, admin: 2 }

  validates :role, presence: true

  private

  def set_default_role
    self.role ||= :client
  end
end
