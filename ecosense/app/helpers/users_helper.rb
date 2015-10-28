module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "about-portrait img-responsive")
  end

  # Returns the User logo
  def get_logo(user)
    if user.respond_to?(:logo)
      user.logo
    else
     "http://www.caxtoneditorial.co.uk/en/wp-content/uploads/2012/02/User.png"
    end
  end

  # Returns the User email
  def get_email(user)
    if user.respond_to?(:email)
      user.email
    else
      "n/a"
    end
  end

  # Returns the User about
  def get_about(user)
    if user.respond_to?(:about)
      user.about
    end
  end

end
