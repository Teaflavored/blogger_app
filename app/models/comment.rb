class Comment < ActiveRecord::Base
	validates :author_name, :body, presence: true
  belongs_to :article
end
