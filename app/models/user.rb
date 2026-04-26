class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { client: 0, professional: 1, admin: 2 }
  enum :sex, { male: 0, female: 1, other: 2 }
  enum :main_goal, {
    lose_weight: 0,
    gain_muscle: 1,
    improve_health: 2,
    maintain: 3
  }

  validates :role, presence: true

  before_save :check_complete_info

  private

  def set_default_role
    self.role ||= :client
  end

  def check_complete_info
    self.has_complete_info =
    full_name.present? &&
    age.present? &&
    sex.present? &&
    city.present? &&
    state.present? &&
    profession.present? &&
    work_routine.present?
  end
end
