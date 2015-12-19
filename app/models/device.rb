class Device < ActiveRecord::Base
  belongs_to :room
  validates_inclusion_of :light, in: [true, false]
  validates_inclusion_of :shade, in: [true, false]
  validates_inclusion_of :door, in: [true, false]
  validates_inclusion_of :camera, in: [true, false]
  validates :ac, presence: true
end
