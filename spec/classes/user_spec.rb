require 'spec_helper'

describe 'setup::user' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it { is_expected.to contain_group($admin_group).with('ensure' => 'present')}

      it { is_expected.to contain_user($default_user).with('ensure' => 'present', 'groups' => $admin_group)}


    end
  end
end
