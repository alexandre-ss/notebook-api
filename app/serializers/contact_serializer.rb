class ContactSerializer < ActiveModel::Serializer
  attributes %i[id name email birthdate]

  belongs_to  :kind do 
    link(:kind) {kind_url(object.kind.id)}
  end
  has_many    :phones
  has_one     :address  

  link(:self) {contact_url(object.id)}


  meta do
    {
      author: "Alexandre Sousa",
      country: "Brasil"
    }

  end
  def attributes(*args)
    h = super(*args)
    #pt-br h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
