class Device < ActiveRecord::Base
  attr_accessible :brand, :calibration_date, :deflection, :description, :folio, :model, :next_calibration, :responsible, :user_id, :status

  validates_presence_of :brand, :calibration_date, :deflection, :description, :folio, :model, :next_calibration, :responsible, :status

  belongs_to :user
end
