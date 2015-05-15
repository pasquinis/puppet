Puppet::Type.type(:wordpress_config).provide(:default) do
  def exists?
    wp_config_filename = resource[:filename]
    if File.exist?(wp_config_filename)
        return check_if_contains_correct_value?(wp_config_filename)
    else
        return false
    end
  end

  def create
    wp_config_filename = resource[:filename]
    wp_config_filename_source = wp_config_filename.gsub(/config\./,'config-sample.')
    fd_read = File.read(wp_config_filename_source)
    config_db = fd_read.gsub('database_name_here', resource[:db_name])
    config_user = config_db.gsub('username_here', resource[:db_user])
    config_last = config_user.gsub('password_here', resource[:db_password])
    File.open(wp_config_filename, "w") do |file|
        file.puts config_last
    end
  end

  def destroy
    puts "Destroy"
  end

  def check_if_contains_correct_value?(wp_file)
    p wp_file
    fd_read = File.read(wp_file)
    arr_fd = fd_read.split("\n")
    arr_fd.any? do |voice|
        p voice.include?(resource[:db_name])
    end
    false
  end

end
