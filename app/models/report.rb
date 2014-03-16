class Report < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :pictures

  validates :title, :body, :category, :user, :slug, presence: true
  validates :slug, uniqueness: true

  accepts_nested_attributes_for :pictures, reject_if: :all_blank

  alias_method :owner, :user
  alias_method :owner=, :user=
end
