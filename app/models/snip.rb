class Snip < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  acts_as_commentable

  validates :name, presence: true
  validates :content, presence: true

end
