class Report < ActiveRecord::Base
  belongs_to :category

  validates :title, :body, :category, :slug, presence: true
  validates :slug, uniqueness: true
end
