#!/bin/bash


# Resets rails database


##### Functions

function development_reset
{
    rake db:drop
    rake db:create
    rake db:migrate
    rake db:seed

}   # end of development_reset


function production_reset
{
    RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake db:drop
    RAILS_ENV=production rake db:create
    RAILS_ENV=production rake db:migrate
    RAILS_ENV=production rake db:seed

}   # end of production_reset

function trigger_all
{
    pre_rake
    development_reset
    production_reset
    after_rake
}

function pre_rake
{
    set -ev
}

function after_rake
{
    :
}

function usage
{
    echo "usage: system_page [[[-f file ] [-i]] | [-h]]"
}


##### Main

while [ "$1" != "" ]; do
    case $1 in
        -e | --env )            shift
                                environment=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     trigger_all
                                exit 1
    esac
    shift
done


# Test code to verify command line processing

if [ "$environment" = "development" ]; then
    pre_rake
    development_reset
    after_rake
else
    pre_rake
    production_reset
    after_rake
fi




