module CompaniesHelper
  # Returns the Company logo
  def get_logo(company)
    if company.respond_to?(:logo)
      company.logo
    else
      "http://www.caxtoneditorial.co.uk/en/wp-content/uploads/2012/02/User.png"
    end
  end

  # Returns the Company email
  def get_email(company)
    if company.respond_to?(:email)
      company.email
    else
      "n/a"
    end
  end

  # Returns the Company email
  def get_address(company)
    if company.respond_to?(:address)
      company.address
    else
      "n/a"
    end
  end

  # Returns the Company about
  def get_about(company)
    if company.respond_to?(:about)
      company.about
    end
  end


end