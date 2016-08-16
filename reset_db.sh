# Resets rails database
set -ev
rake db:drop
rake db:create 
rake db:migrate
rake db:seed
