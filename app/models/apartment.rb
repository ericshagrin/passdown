# == Schema Information
#
# Table name: apartments
#
#  id                      :integer          not null, primary key
#  description             :string
#  furniture_amt           :string
#  interested_buyers_count :integer
#  location                :string
#  num_bath                :integer
#  num_bdrms               :string
#  photos_count            :integer          default(0)
#  price                   :integer
#  status                  :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :integer
#
class Apartment < ApplicationRecord
  validates(:price, { :numericality => { :greater_than => 1 } })
  validates(:price, { :presence => true })
  validates(:num_bdrms, { :presence => true })
  validates(:num_bath, { :numericality => { :greater_than => 0 } })
  validates(:num_bath, { :presence => true })
  validates(:location, { :presence => true })
  validates(:furniture_amt, { :presence => true })
  validates(:description, { :presence => true })
  validates(:user_id, { :uniqueness => true })


  belongs_to(:seller, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  
  has_many(:photos, { :class_name => "Photo", :foreign_key => "apt_id", :dependent => :destroy })

  has_many(:interested_buyers, { :class_name => "InterestedBuyer", :foreign_key => "apt_id", :dependent => :destroy })
end
