require 'spec_helper'

describe command('pgrep java') do
  it { should return_exit_status 0 }
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

  it 'WebUI should contain string "Nimbus uptime"' do
    expect(
      command('wget -O - http://localhost:8080/')
    ).to return_stdout(/Nimbus uptime/)
  end
end
