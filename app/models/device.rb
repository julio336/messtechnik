class Device < ActiveRecord::Base
  attr_accessible :brand, :calibration_date, :deflection, :description, :folio, :model, :next_calibration, :responsible, :user_id

  belongs_to :user
end
