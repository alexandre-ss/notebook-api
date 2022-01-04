# frozen_string_literal: true

class User < ActiveRecord::Base
  
  # i dont know why but rails 6 need this extension
  # and it was not generated automatically
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
