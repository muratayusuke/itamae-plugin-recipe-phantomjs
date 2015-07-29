require 'docker'
Excon.defaults[:write_timeout] = 1000
Excon.defaults[:read_timeout] = 1000

include_recipe '../lib/itamae/plugin/recipe/phantomjs/system.rb'
