class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, uniqueness: true
         validates :mobile_no, uniqueness: true
         
         # Search user by mobile number(not email)
         def self.find_first_by_auth_conditions(warden_conditions)
           conditions = warden_conditions.dup
           where(mobile_no: conditions[:mobile_no]).first
         end
         
         # Stop using email as authentication key
         def email_required?
           false
         end
         
         def email_changed?
           false
         end
         
         def will_save_change_to_email?
           false
         end

        end
