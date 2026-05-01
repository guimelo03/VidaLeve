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

  belongs_to :professional, class_name: "User", optional: true

  has_many :diets, dependent: :destroy
  has_many :clients, class_name: "User", foreign_key: :professional_id, dependent: :nullify
  has_many :client_diets, through: :clients, source: :diets

  validates :role, presence: true

  before_validation :normalize_phone

  before_save :check_complete_info


  def normalize_phone
    return if phone.blank?

    self.phone = phone.gsub(/\D/, "")
  end

  private

  def set_default_role
    self.role ||= :client
  end

  def check_complete_info
    return unless client?

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
