# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes %i[id city street]
end
