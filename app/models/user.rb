class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :device_type
  # attr_accessible :title, :body
  validates_presence_of :username

  has_many :devices, :dependent => :destroy

  def next_calibration
    device = []
    self.devices.each do |equipo|
      logger.debug "#{equipo}\n\n\n\n\n\n"
      if Time.now-30.days <= equipo.next_calibration && Time.now >= equipo.next_calibration
        device << equipo
        return device
      end
    end 
  end  

end
