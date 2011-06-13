class UseCase < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, :class_name => 'User'

  has_many :comments, :as => :commentable

  validates_presence_of :project, :description
end
