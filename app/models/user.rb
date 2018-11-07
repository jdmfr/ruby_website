class User < ApplicationRecord
  validates :name ,presence: true ,uniqueness: true
  action_store :like, :product, counter_cache: true
  #has_many :products , :through => :collect_lines
  has_secure_password

end
