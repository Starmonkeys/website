class UseCase < ActiveRecord::Base
  belongs_to :project
  belongs_to :author, :class_name => 'User'

  has_many :comments, :as => :commentable
  has_many :tasks

  validates_presence_of :project, :description
end
