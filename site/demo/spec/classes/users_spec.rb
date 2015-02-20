require 'spec_helper'

describe 'dojo::users' do
  it { should compile.with_all_deps }
  it { should contain_user('art') }
  it { should contain_service('ssh').with_ensure('running') }
end
