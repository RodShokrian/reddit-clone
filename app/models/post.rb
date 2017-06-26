# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  author_id  :integer
#  sub_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, presence: true

  has_many :postsubs,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: :Postsub

  has_many :subs, through: :postsubs

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  has_many :comments
end
