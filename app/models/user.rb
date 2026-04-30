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

  has_many :diets, dependent: :destroy

  validates :role, presence: true

  before_save :check_complete_info

  private

  def set_default_role
    self.role ||= :client
  end

  def check_complete_info
    required = [
      full_name,
      age,
      phone,
      sex,
      city,
      state,
      profession,
      work_routine,
      current_weight,
      height,
      main_goal,
      main_discomfort
    ]

    if measured_with_tape?
      required << abdominal_circumference
    end

    self.has_complete_info = required.all?(&:present?)
  end
end
