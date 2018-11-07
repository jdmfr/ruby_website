class User < ApplicationRecord
  validates :name ,presence: true ,uniqueness: true
  #has_many :products , :through => :collect_lines
  has_secure_password

end
