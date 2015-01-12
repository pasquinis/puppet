require 'spec_helper'

describe 'demo::nginx' do
  it { should compile }
  it { should contain_service('nginx') }
end
