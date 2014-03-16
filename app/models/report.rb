class Report < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :pictures

  validates :title, :body, :category, :user, :slug, presence: true
  validates :slug, uniqueness: true

  alias_method :owner, :user
  alias_method :owner=, :user=
end
