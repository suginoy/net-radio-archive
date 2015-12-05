# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#
# Learn more: http://github.com/javan/whenever

job_type :rake_not_silent, 'export PATH=/usr/local/bin:$PATH; export LANG=en_US.UTF-8; cd :path && :environment_variable=:environment bundle exec rake :task :output'

every 1.minute do
  rake_not_silent 'main:rec_one'
end

every '3-50/3 * * * *' do
  rake_not_silent 'main:rec_ondemand'
end

every '12 * * * *' do
  rake_not_silent 'main:radiko_scrape'
end

every '37 15 * * *' do
  rake_not_silent 'main:kill_zombie_process'
end

every '7 16 * * *' do
  rake_not_silent 'main:rm_working_files'
end
