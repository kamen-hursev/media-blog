class Category < ActiveRecord::Base
  has_many :reports, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :name, uniqueness: true
end
