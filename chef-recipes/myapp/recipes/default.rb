
unless File.file? '/etc/APT_GET_INITIAL_UPDATE_COMPLETED'
  bash 'apt-get update' do
    code <<-EOH
      apt-get update
      touch /etc/APT_GET_INITIAL_UPDATE_COMPLETED
    EOH
  end
end

# other stuff...
include_recipe 'pound'
include_recipe 'nodejs'

# install mongodb
package 'mongodb-server'

# XXX this should perhaps go somewhere else, but for now, i like having this always
package 'tmux'
package 'vim'
package 'tree'
package 'zsh'
package 'git'

