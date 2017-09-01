set :output, 'log/crontab.log'
set :environment, :production

every 10.minutes do
  runner 'User.kuma_schedule'
end
