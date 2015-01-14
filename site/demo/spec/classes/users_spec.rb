require 'spec_helper'

describe 'demo::users' do
  it { should compile.with_all_deps }
  it { should contain_user('art') }
end
