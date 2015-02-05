require 'spec_helper'

describe command('pgrep java') do
  its(:exit_status) { is_expected.to eq 0 }
end

describe 'Storm Nimbus' do
  describe file '/opt/storm/current/logs' do
    it { is_expected.to be_linked_to '/var/log/storm' }
  end

  it 'is listening on port 6702' do
    expect(port(6702)).to be_listening
  end

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
    describe command('wget -O - http://localhost:8080/') do
      its(:stdout) { is_expected.to match(/Nimbus uptime/) }
    end
  end
end
