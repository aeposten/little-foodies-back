class UserChildrenSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :password, :password_confirmation
  has_many :children
end
