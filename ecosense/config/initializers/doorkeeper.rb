

Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_from_credentials do |routes|
    user = User.find_by(email: request.params[:username].downcase)
    if user && user.authenticate(request.params[:password])
      user
    end
  end

end


Doorkeeper.configuration.token_grant_types << "password"