class Article < ActiveRecord::Base
	validates :title, :body, presence: true
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
		self.tags.map do |tag|
			tag.name
		end.join(", ")
	end


	def tag_list=(tag_strings)
		tag_names = tag_strings.split(",").map do |tag_string|
								tag_string.strip.downcase
							end.uniq
		
		new_and_found_tags = tag_names.map do |tag_name|
													Tag.find_or_create(name: tag_name)
												end

		self.tags = new_and_found_tags
	end
end
