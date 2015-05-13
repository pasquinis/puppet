Puppet::Type.newtype(:wordpress_config) do
  @doc = "Manages the setup for WordPress"
  ensurable


  newparam(:filename, :namevar => true) do
    desc "The filename for wp-config"
  end

  newproperty(:db_name) do
    desc "The name of database for WordPress"
  end

  newproperty(:db_user) do
    desc "The MySQL database username"
  end

  newproperty(:db_password) do
    desc "The MySQL database password"
  end
end
