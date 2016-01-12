require 'spec_helper'

describe 'dojo::ruby' do
  let(:params) {
    { :version => '1.9.2', :given_key => 'abcdefgh', :short_given_key => 'abcd'}
  }
  it { should compile.with_all_deps }
end
