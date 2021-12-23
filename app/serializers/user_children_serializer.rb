class UserChildrenSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :password, :password_confirmation, :image
  has_many :children
end
