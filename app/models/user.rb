class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :create_role

  belongs_to :role
  devise :omniauthable, :omniauth_providers => [:facebook]

  def is?(role)
  	self.role.name.to_sym === role
  end

  def self.find_or_create_by_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      if auth.info.image.present?
        user.update_attribute(:image, auth.info.image)
      end
    else
      user = User.new
	    user.email = auth.info.email
	    user.password = user.password_confirmation = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	    user.image = auth.info.image # assuming the user model has an image
	  end
    user
	end

  # Used for devise if the provider doesn't provide some information
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"] if user.name.blank?
        user.image = data["image"] if user.image.blank?
      end
    end
  end	
private
  def create_role
    if !self.role
      self.update_attribute(:role_id, Role.find_by_name('user').id)
    end
  end
end
