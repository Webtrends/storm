require 'spec_helper'

describe 'Storm Supervisor' do
  # This only works with Nimbus running as well
  it 'is listening on port 6702' do
    expect(port(6702)).to be_listening
  end

  it 'has a running service of supervisor' do
    expect(service('supervisor')).to be_running
  end
end

describe command('pgrep java') do
  its(:exit_status) { is_expected.to eq 0 }
end
