class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	attachment :profile_image
	has_many :books
	validates :name, presence: true, uniqueness: { case_sensitive: :false },length: { minimum: 2, maximum: 20 }

	def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
    	where(conditions).where(["name = :value", { :value => name }]).first
    else
    	where(conditions).first
    end
  end
end
