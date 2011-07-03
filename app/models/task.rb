class Task < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :owner, :class_name => 'User'
  belongs_to :project
  belongs_to :use_case

  has_many :comments, :as => :commentable

  validates_presence_of :title, :project
end
