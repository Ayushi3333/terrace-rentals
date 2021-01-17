module ApplicationHelper
  def show_terrace_photo(terrace)
    photo = terrace.photos.sample
    if photo
      cl_image_tag photo.key, class: "card-img-top"
    else
      image_tag('placeholder.jpg')
    end
  end

  def show_profile_picture
    photo_user = current_user.photo
    if photo_user.present?
      cl_image_tag(photo_user.key, :transformation=>[{:width=>40, :height=>40, :gravity=>"face", :radius=>"max", :crop=>"thumb"},
        {:width=>40, :crop=>"scale"}])
    else
      image_tag("https://cdn2.iconfinder.com/data/icons/circle-avatars-1/128/039_girl_avatar_profile_woman_headband-512.png",
         size: "40")
    end
  end
end
