# == Schema Information
#
# Table name: postsubs
#
#  id         :integer          not null, primary key
#  sub_id     :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Postsub < ApplicationRecord
  belongs_to :post

  belongs_to :sub
end
