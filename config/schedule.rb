set :output, 'log/crontab.log'
set :environment, :production

every 30.minutes do
  runner 'User.kuma_schedule'
end
