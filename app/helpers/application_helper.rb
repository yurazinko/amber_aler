module ApplicationHelper
  def sanitize_wysiwyg(text, shorten: nil)
    res = sanitize(text, tags: %w(p strong em u table thead tbody th tr td h4 h5 h6 pre br hr ul ol li blockquote), attributes: %w(id class style))
    res = truncate_html(res, length: shorten, omission: '...') if shorten.present?
    res
  end

  def avatar_source(user)
  	if user.avatar?
      image_tag user.avatar.url(:thumb)
    else
      image_tag "default-userpic.jpg"
    end
  end

#  def avatar_tag(user, size: 200, alt: nil, real: false, **options)
#    image_tag(
#      avatar_url(user, size: size, real: real),
#      alt: (alt || user.name),
#      class: options[:class],
#      data: {hash: email_hexdigest_for(user)})
#  end

#  def email_hexdigest_for(user)
#    Digest::MD5.hexdigest(user.email&.downcase)
#  end
end
