# frozen_string_literal: true

class PhoneSerializer < ActiveModel::Serializer
  attributes %i[id number]
end
