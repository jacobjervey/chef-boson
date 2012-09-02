user_account 'boson' do
	comment 'User for running boson and boson-powered gameservers'
	manage_home false
	if platform?("ubuntu", "debian")
		shell '/usr/sbin/nologin'
	else
		shell '/sbin/nologin'
	end
	system_user true
end

directory '/opt/boson' do
	owner 'boson'
	group 'boson'
	mode '0775'
	action :create
end

%w{servers config logs agent}.each do |dir|
	directory "/opt/boson/#{dir}" do
		owner 'boson'
		group 'boson'
		mode '0775'
		action :create
	end
end