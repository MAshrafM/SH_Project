class Device < ActiveRecord::Base
  belongs_to :room
  #validates :light, presence: true
  #validates :ac, presence: true
  #validates :shade, presence: true
  #validates :door, presence: true
  #validates :camera, presence: true
end
