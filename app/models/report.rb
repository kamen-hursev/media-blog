class Report < ActiveRecord::Base
  MAX_PICTURES = 5

  belongs_to :category
  belongs_to :user
  has_many :pictures

  validates :title, :body, :category, :user, :slug, presence: true
  validates :slug, uniqueness: true
  validate :valid_number_of_pictures

  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: :invalid_picture?

  alias_method :owner, :user
  alias_method :owner=, :user=

  def slug_suggestion
    slug = title.downcase.gsub(/\s+/, '_')
    slug if !Report.where(slug: slug).first
  end

  private

  def invalid_picture?(attributes)
    attributes['file'].blank? && attributes['id'].blank?
  end

  def valid_number_of_pictures
    if pictures.size > MAX_PICTURES
      errors.add(:pictures, "are more than alowed. Maximum #{MAX_PICTURES} are allowed")
    end
  end
end
