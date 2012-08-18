
package 'pound'

key_path = '/etc/ssl/private/bhomg.com.pem'

unless File.file? key_path
  cookbook_file key_path do
    source 'bhomg.com.pem'
    mode '0400'
  end

  cookbook_file '/etc/pound/pound.cfg' do
    source 'pound.cfg'
    mode '0644'
  end

  cookbook_file '/etc/default/pound' do
    source 'etc-default-pound'
    mode '0644'
  end

  # take new config
  service 'pound' do
    action :restart
  end
end

