module ApplicationHelper
  def avatar_image(img)
    img.present? ? image_tag(img, size: "40x40") : ""
  end
end
