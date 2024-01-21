class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :uid, :provider, :email, :status
end
