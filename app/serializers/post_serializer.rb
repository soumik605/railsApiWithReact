class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :desc
end
