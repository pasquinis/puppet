Puppet::Type.type(:wordpress_config).provide(:default) do
  def exists?
    wp_config_filename = resource[:filename]
    if File.exist?(wp_config_filename)
        return check_if_contains_correct_value?
    else
        return false
    end
  end

  def create
    wp_config_filename = resource[:filename]
    wp_config_filename_source = wp_config_filename.gsub(/config\./,'config-sample.')
    FileUtils.cp(wp_config_filename_source, wp_config_filename, :preserve => true )

  end

  def destroy
    puts "Destroy"
  end

  def check_if_contains_correct_value?
    false
  end

end
