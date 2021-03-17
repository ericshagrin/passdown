# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  apt_id     :integer
#
class Photo < ApplicationRecord

  validates(:picture, { :presence => true })
  validates(:apt_id, { :presence => true })

  belongs_to(:apt, { :required => false, :class_name => "Apartment", :foreign_key => "apt_id", :counter_cache => true })

  has_one(:seller, { :through => :apt, :source => :seller })
end
