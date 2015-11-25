module ApplicationHelper

  def gravatar_image(email)
    has_gravatar?(gravatar_url(email)) ? gravatar_tag(email, size: 40) : ""
  end

  def has_gravatar?(url)
    !url.include?("ed955fd3e6278969c23c7c148aa09aff")
  end
end
