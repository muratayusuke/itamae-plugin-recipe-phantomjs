version = (node[:phantomjs] && node[:phantomjs][:version]) || '2.0.0'
if `which phantomjs && phantomjs --version`.chomp == version
  puts "phantomjs #{version} is already installed"
  return
end

execute 'apt-get update'

%w(build-essential g++ flex bison gperf ruby perl libsqlite3-dev
  libfontconfig1-dev libicu-dev libfreetype6 libssl-dev libpng-dev
  libjpeg-dev python libx11-dev libxext-dev ttf-mscorefonts-installer git).each do |p|
  package p
end

tmp_dir = '/tmp/phantomjs'

execute "git clone git://github.com/ariya/phantomjs.git #{tmp_dir}" do
  not_if "test -d #{tmp_dir}"
end

execute 'git fetch' do
  cwd tmp_dir
end

execute "git checkout #{version}" do
  cwd tmp_dir
end

jobs = if node[:phantomjs] && node[:phantomjs][:jobs]
         "--jobs #{node[:phantomjs][:jobs]}"
       else
         ''
       end
execute "./build.sh --confirm #{jobs}" do
  cwd tmp_dir
end
