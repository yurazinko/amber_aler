module ApplicationHelper
  def avatar_url(user, size: 200, real: false)
    gravatar_id = email_hexdigest_for user
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}#{real && "&d=404"}"
  end

  def avatar_tag(user, size: 200, alt: nil, **options)
    image_tag(
      avatar_url(user, size: options[:size], real: options[:real]),
      alt: (options[:alt] || user.name),
      class: options[:class],
      data: {hash: email_hexdigest_for(user)})
  end

  def email_hexdigest_for(user)
    Digest::MD5.hexdigest(user.email&.downcase)
  end
end