require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

class Post < ActiveRecord::Base
  belongs_to :user
end

class Follow < ActiveRecord::Base

end

class Comment < ActiveRecord::Base

end

class Pm < ActiveRecord::Base

end
