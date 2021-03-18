# == Schema Information
#
# Table name: interested_buyers
#
#  id           :integer          not null, primary key
#  email        :string
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  apt_id       :integer
#
class InterestedBuyer < ApplicationRecord
  validates(:name, { :presence => true })
  validates(:email, { :presence => true })
  validates(:apt_id, { :presence => true })
  validates(:apt_id, {uniqueness: { scope: :email }})

  belongs_to(:apt, { :required => false, :class_name => "Apartment", :foreign_key => "apt_id", :counter_cache => true })
  has_one(:seller, { :through => :apt, :source => :seller })
end
