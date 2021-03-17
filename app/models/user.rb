# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  apt_id          :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  validates(:name, { :presence => true })


  has_many(:apartments, { :class_name => "Apartment", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:photos, { :through => :apartments, :source => :photos })
  has_many(:interested_buyers, { :through => :apartments, :source => :interested_buyers })
end
