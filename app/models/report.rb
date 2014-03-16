class Report < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :pictures

  validates :title, :body, :category, :user, :slug, presence: true
  validates :slug, uniqueness: true

  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: :all_blank

  alias_method :owner, :user
  alias_method :owner=, :user=

  private
  def invalid_picture? attributes
    attributes['file'].blank?
  end
end
