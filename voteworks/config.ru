require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride # to be able to use 'patch' 
use SessionsController # need to 'mount' to run
use RegistryController
use UsersController
run ApplicationController # 'run' because it's the first/main controller 
