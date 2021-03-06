class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :organization
  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  enum role: [:admin, :staff, :brunsfield, :sandbox]

  validates :email,
    presence: { message: "Your email is required." },
    uniqueness:{message: "Your email is already in use."}

  validates :first_name,
    presence: {message: "Your first name is required."}

  validates :last_name,
    presence: {message: "Your last name is required."}

  validates :username,
    presence: {message: "Username is required."},
    uniqueness: {message: "Username is already taken."}

  validates :password, unless: :skip_password_validation,
    presence: {message: "Please provide a password."},
    confirmation: {message: "Your passwords do not match."}

  attr_accessor :skip_password_validation

  def set_default_role
    self.role ||= :staff
  end

  def set_role(new_role)
    self.role = new_role
  end

  def get_full_name
    self.first_name + " " + last_name
  end

  def admin?
    self.role.eql?("admin")
  end
end
