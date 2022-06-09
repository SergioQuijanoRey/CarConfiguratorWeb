class Extra < ApplicationRecord
  validates :nombre, presence: true
  validates :nombre, uniqueness: true
  has_one_attached :image, :dependent => :destroy

end
