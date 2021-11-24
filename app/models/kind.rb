class Kind < ApplicationRecord
  has_many :contactss, class_name: "contacts", foreign_key: "reference_id"
end
