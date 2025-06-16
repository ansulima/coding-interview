class User < ApplicationRecord
  belongs_to :company
  has_many :tweets

  validates :username, :email, presence: true, uniqueness: true

  scope :by_company, -> (identifier) { where(company_id: company_id) if identifier.present? }
  scope :by_username, -> (username) { where('username ILIKE ?', "%#{username}%") if username.present? }

  # Callback
  after_create :send_welcome_email

  private

  def send_welcome_email
    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now
    end
  end
end
