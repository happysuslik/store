class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings, :inverse_of => :user
  belongs_to :bill_addr, class_name: "Address", dependent: :destroy
  belongs_to :ship_addr, class_name: "Address", dependent: :destroy
  has_many :orders, dependent: :destroy, :inverse_of => :user

  validates_presence_of :name, :last_name

  def admin?
    self.admin == true
  end

  # def cart
  #   orders.find_or_create_by(state: 'in_progress')
  # end

  # def self.find_for_facebook_oauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_create do |user|
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.email = auth.info.email
  #       user.password = Devise.friendly_token[0,20]
  #       user.name, user.last_name = auth.info.name.split
  #   end
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end
end
