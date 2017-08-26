server '52.192.86.216', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/katanosakahiroaki/.ssh/id_rsa'
