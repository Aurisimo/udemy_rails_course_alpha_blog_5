module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    hash = Digest::MD5.hexdigest(user.email)

    image_tag "https://www.gravatar.com/avatar/#{hash}?s=#{options[:size]}",
              alt: user.username, class: 'rounded mx-auto d-block'
  end
end
