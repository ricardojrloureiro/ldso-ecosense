module CompaniesHelper
  # Returns the Company logo
  def get_logo(company)
    default_url = 'http://www.caxtoneditorial.co.uk/en/wp-content/uploads/2012/02/User.png'
    if company.logo.blank?
      default_url
    else
      company.logo
    end
  end

  # Returns the Company email
  def get_email(company)
    if company.email.blank?
      "n/a"
    else
      company.email
    end
  end

  # Returns the Company email
  def get_address(company)
    if company.address.blank?
      "n/a"
    else
      company.address
    end
  end

  # Returns the Company about

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