module TopicsHelper
  def topic_img(topic)
    if topic.image?
      image_tag(topic.image, alt: topic.title) if topic.image?
    else
      image_tag("no_image.png", alt: "no_image")
    end
  end
end
