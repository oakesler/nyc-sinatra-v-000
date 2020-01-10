$LOAD_PATH.unshift '.'
require 'config/environment'

require_relative 'app/controllers/figures_controller.rb'
require_relative 'app/controllers/landmarks_controller.rb'
require_relative 'app/controllers/application_controller.rb'


use Rack::Static, urls: ['/css'], root: 'public' # Rack fix allows seeing the css folder.

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use FiguresController
use LandmarksController
run ApplicationController
