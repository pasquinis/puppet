require 'spec_helper'

describe 'demo::nginx' do
  it { should compile }
  it { should contain_package('apache2').with_ensure('absent') }
  it { should contain_service('nginx').with_ensure('running') }
end
