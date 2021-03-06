# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

require 'yaml'

begin
  config = YAML.load_file(File.expand_path('../deploy/' + ENV['DEPLOY'] + '.yml', __FILE__))
  puts config["message"] unless config["message"].nil?
  repository = config["repository"]
rescue Exception => e
  # puts e.message
  puts "Sorry, the file config/deploy/" + ENV['DEPLOY'] + '.yml does not exist.'
  exit
end

set :application, "ODC"
set :repo_url, repository

set :default_stage, "production"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/u/apps/odc"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/application_config.yml"

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

#set :passenger_environment_variables, { :path => '/path-to-passenger/bin:$PATH' }
#set :passenger_restart_command, '/path-to-passenger/bin/passenger-config restart-app'
