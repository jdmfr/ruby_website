class Product < ApplicationRecord
	mount_uploader :image_url , AvatarUploader
	belongs_to :provider
	has_many :line_items
	belongs_to :category
	#has_many :products ,:through => :collect_lines

	before_destroy :ensure_not_referenced_by_any_line_item


	private

	def ensure_not_referenced_by_any_line_item
		unless line_items.empty?
			errors.add(:base, 'Line Items present')
			throw :abort
		end
	end
	
end
