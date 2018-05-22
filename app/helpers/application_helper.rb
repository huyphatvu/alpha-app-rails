module ApplicationHelper
  def gravatar_for(user, options ={size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url =  "https://www.secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag("cat.jpg", alt: user.username)
  end
end
