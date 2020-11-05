class Book < ApplicationRecord
  validates :name, presence: true
  validates :writer_id, presence: true
  belongs_to :writer
end
