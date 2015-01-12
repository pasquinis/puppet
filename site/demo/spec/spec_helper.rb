require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))
module_original_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', 'modules'))

RSpec.configure do |c|
  c.color = true
  c.formatter = :documentation
  c.module_path = File.join(fixture_path, 'modules') + ':' + File.join(fixture_path, 'site')
  c.manifest_dir = File.join(fixture_path, 'manifests')

end
