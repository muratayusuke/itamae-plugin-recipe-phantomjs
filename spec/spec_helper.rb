require 'docker'
require 'serverspec'

set :backend, :docker
set :docker_url, ENV["DOCKER_HOST"]
set :docker_image, ENV['DOCKER_IMAGE_PHANTOMJS']

# TODO https://github.com/swipely/docker-api/issues/202
Excon.defaults[:ssl_verify_peer] = false
