Puppet::Type.type(:wordpress_config).provide(:default) do
  def exists?
    puts "Exists?"
  end

  def create
    puts "Create"
  end

  def destroy
    puts "Destroy"
  end
end
