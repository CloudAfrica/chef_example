# --- Install packages we need ---

# Create /wwwroot directory
directory '/wwwroot' do
  owner "root"
  group "root"
  mode "0755"
end.run_action(:create)

# Copy sample html file
cookbook_file "/wwwroot/index.html" do
    source "index.html"
    owner "root"
    group "root"
    mode "0644"
end

directory '/var/chef-package-cache' do
  owner "root"
  group "root"
  mode "0755"
end.run_action(:create)

cookbook_file "/var/chef-package-cache/nginx_1.4.1-1~precise_amd64.deb" do
    source "nginx_1.4.1-1~precise_amd64.deb"
    owner "root"
    group "root"
    mode "0444"
end

dpkg_package 'nginx' do
	package_name 'nginx'
	source '/var/chef-package-cache/nginx_1.4.1-1~precise_amd64.deb'
	action :install
end

cookbook_file "/etc/nginx/nginx.conf" do
    source "nginx.conf"
    owner "root"
    group "root"
    mode "0444"
end

service "nginx" do
  action :restart
end
