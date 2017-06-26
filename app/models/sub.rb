# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  mod_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true

  has_many :postsubs,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: :Postsub

  has_many :posts, through: :postsubs

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :mod_id,
  class_name: :User


end
