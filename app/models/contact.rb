class Contact < ApplicationRecord
  belongs_to :kind
  has_many   :phones
  accepts_nested_attributes_for :phones, allow_destroy: true
  has_one :address
  accepts_nested_attributes_for :address
#  def birthdate_to_pt
#    I18n.l(self.birthdate) unless self.birthdate.blank?
#  end
end
 