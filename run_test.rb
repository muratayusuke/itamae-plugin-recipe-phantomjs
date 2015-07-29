image = 'muratayusuke/itamae-plugin-recipe-phantomjs'

puts 'Build docker image:'
puts `docker build -t #{image} .`

puts 'Provision docker image:'
output = []
IO.popen("bundle exec itamae docker spec/recipe.rb --image=#{image} -l debug").each do |line|
  puts line
  output << line.chomp
end
last_line = output.last
ENV['DOCKER_IMAGE_PHANTOMJS'] = last_line.scan(/Image created: (.*)\n/).first.first
p "provisioned image: #{ENV['DOCKER_IMAGE_PHANTOMJS']}"

puts 'Run rspec test:'
puts `bundle exec rspec`
