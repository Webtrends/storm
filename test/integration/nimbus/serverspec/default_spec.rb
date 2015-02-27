require 'spec_helper'

describe command('pgrep java') do
  its(:exit_status) { is_expected.to eq 0 }
end

describe 'Storm Nimbus' do
  # This only works with Nimbus running as well
  # it 'is listening on port 6702' do
  #   expect(port(6702)).to be_listening
  # end

  it 'has a running service of nimbus' do
    expect(service('nimbus')).to be_running
  end

  it 'Should be listening on tcp6/6627' do
    expect(port(6627)).to be_listening.with('tcp6')
  end

  it 'Should be listening on tcp6/8080' do
    expect(port(8080)).to be_listening.with('tcp6')
  end

  context 'WebUI should contain string "Nimbus uptime"' do
    describe command('wget -O - http://localhost:8080/api/v1/cluster/summary') do
      its(:stdout) { is_expected.to match(/nimbusUptime/) }
    end
  end
end
