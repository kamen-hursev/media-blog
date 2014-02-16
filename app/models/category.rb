class Category < ActiveRecord::Base
  has_many :reports, :dependent => :restrict

  validates :name, presence: true
end
