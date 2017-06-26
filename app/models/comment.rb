# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  author_id  :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :content, :author, :post, presence: true

  belongs_to :post
  
  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

end
