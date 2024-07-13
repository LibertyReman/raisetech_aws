require 'spec_helper'


# ==========================================================================
# 動作環境テスト
# ==========================================================================

# バージョン3.1.2のRubyがインストールされているかの確認
describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /3\.1\.2/ }
end

# バージョン2.3.14のBundlerがインストールされているかの確認
describe command('bundler -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /2\.3\.14/ }
end

# バージョン7.0.4のRailsがインストールされているかの確認
describe command('rails -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /7\.0\.4/ }
end

# バージョン17.9.1のNodeがインストールされているかの確認
describe command('node -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /17\.9\.1/ }
end

# バージョン1.22.19のyarnがインストールされているかの確認
describe command('yarn -v') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /1\.22\.19/ }
end


# ==========================================================================
# 稼働テスト
# ==========================================================================

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

# Unicornが起動しているかの確認
describe command('ps -ef | grep unicorn | grep -v grep') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
end

# 3000番ポートがリクエストを受け付けていないことの確認
describe port(3000) do
  it { should_not be_listening }
end

