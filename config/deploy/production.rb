server '52.192.86.216', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/katanosakahiroaki/.ssh/id_rsa'

require "delayed/recipes"

role :delayed_job, '52.192.86.216' # ワーカ用サーバの指定
set :delayed_job_server_role, :delayed_job   # delayed_jobのワーカを動かすロール名の設定
set :delayed_job_command, defer { "#{bundle_cmd} exec bin/delayed_job" }

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"
