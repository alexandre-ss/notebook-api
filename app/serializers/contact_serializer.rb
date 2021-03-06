# frozen_string_literal: true

# serializers for contacts
class ContactSerializer < ActiveModel::Serializer
  attributes %i[id name email birthdate]

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end

  has_one :address do
    link(:related) { contact_address_url(object.id) }
  end

  # link(:self) {contact_url(object.id)}

  meta do
    {
      author: 'Alexandre Sousa',
      country: 'Brasil'
    }
  end

  def attributes(*args)
    h = super(*args)
    # pt-br h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
