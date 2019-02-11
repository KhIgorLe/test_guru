module BadgesHelper
  def badge_image(badge)
    image_tag(badge.image, height: "42", width: "42")
  rescue Sprockets::Rails::Helper::AssetNotFound
    'Изображения не найдено'
  end
end
