class Project < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'

  has_many :tasks, :as => :taskable
  has_many :use_cases
  has_many :comments, :as => :commentable

  validates_presence_of :title
  validates_uniqueness_of :title
end
