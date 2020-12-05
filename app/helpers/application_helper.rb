module ApplicationHelper
  def show_terrace_photo(terrace)
    photo = terrace.photos.sample
    if photo
      cl_image_tag photo.key, height: 300, class: "card-img-top"
    else
      image_tag('placeholder.jpg')
    end
  end
end
