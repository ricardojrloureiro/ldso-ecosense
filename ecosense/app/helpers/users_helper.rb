module UsersHelper

  # Returns the User logo
  def get_logo(user)
    default_url = 'http://www.caxtoneditorial.co.uk/en/wp-content/uploads/2012/02/User.png'
    if user.logo.blank?
      default_url
    else
      user.logo
    end
  end

  # Returns the User email
  def get_email(user)
    if user.email.blank?
      "n/a"
    else
      user.email
    end
  end

  def get_birthday(user)
    if user.birthday.blank?
      "n/a"
    else
      user.birthday
    end
  end
  def get_residence(user)
    if user.residence.blank?
      "n/a"
    else
      user.residence
    end
  end
  def get_occupation(user)
    if user.occupation.blank?
      "n/a"
    else
      user.occupation
    end
  end

  # Returns the User about
  def get_about(user)
    if user.about.blank?
      "n/a"
    else
      user.about
    end
  end

end
