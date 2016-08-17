# Resets rails database
set -ev
rake db:drop
rake db:create 
rake db:migrate
rake db:seed

RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake db:drop
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed