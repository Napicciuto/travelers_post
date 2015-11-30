class Comment < ActiveRecord::Base
  include Gravatarify::Helper

  validates :name, :comment, presence: true
  validates_format_of :email, :with => /@/, allow_blank: true

  default_scope  { order(created_at: :desc) }

  def self.comment_count
    count
  end

  def gravatar_image
    return "" if email.blank?
    gravatar_url(email)
  end
end

