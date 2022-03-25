class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :age

  has_many :posts
end
