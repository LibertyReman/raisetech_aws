require 'spec_helper'

# gitがインストールされているかの確認
describe package('git') do
  it { should be_installed }
end

# バージョン3.1.2のRubyがインストールされているかの確認
describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /ruby 3\.1\.2/ }
end

describe 'Nginx' do
  listen_port = 80

  # Nginxがインストールされているかの確認
  describe package('nginx') do
    it { should be_installed }
  end

  # Nginxが有効かつ実行中かの確認
  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  # 80番ポートがリクエストを受け付けているかの確認
  describe port(listen_port) do
    it { should be_listening }
  end

  # HTTPステータスコードが200であることの確認
  describe command('curl http://127.0.0.1:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
    its(:stdout) { should match /^200$/ }
  end
end

# 3000番ポートがリクエストを受け付けていないことの確認
describe port(3000) do
  it { should_not be_listening }
end
