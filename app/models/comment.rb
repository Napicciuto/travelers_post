class Comment < ActiveRecord::Base
  validates :name, :comment, presence: true
  validates_format_of :email, :with => /@/

  default_scope  { order(created_at: :desc) }
end

