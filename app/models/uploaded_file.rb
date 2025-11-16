class UploadedFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :file, presence: true
  validates :uploaded_at, presence: true

  before_validation :set_uploaded_at, on: :create

  private

  def set_uploaded_at
    self.uploaded_at ||= Time.current
  end
end
