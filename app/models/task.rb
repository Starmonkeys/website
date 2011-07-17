class Task < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :owner, :class_name => 'User'
  belongs_to :project
  belongs_to :use_case

  has_many :comments, :as => :commentable

  STATUS_CODES = {
    :open     => 0,
    :claimed  => 1,
    :finished => 2,
  }

  validates_presence_of :title, :project
  validates_inclusion_of :status_id, :in => STATUS_CODES.values

  scope :incomplete, where("status_id IS NOT #{STATUS_CODES[:finished]}")

  def status
    STATUS_CODES.invert[status_id]
  end

  def status=(stat)
    self.status_id = STATUS_CODES[stat]
  end
end
