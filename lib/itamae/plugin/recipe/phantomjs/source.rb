version = (node[:phantomjs] && node[:phantomjs][:version]) || '2.0.0'
if `which phantomjs && phantomjs --version`.chomp == version
  puts "phantomjs #{version} is already installed"
  return
end

execute 'apt-get update'

%w(build-essential g++ flex bison gperf ruby perl libsqlite3-dev
  libfontconfig1-dev libicu-dev libfreetype6 libssl-dev libjpeg-dev
  python libx11-dev libxext-dev ttf-mscorefonts-installer git).each do |p|
  package p
end

execute 'install libpng' do
  cwd '/tmp'
  command <<-EOC
    wget ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng16/libpng-1.6.18.tar.gz
    tar xvf libpng-1.6.18.tar.gz
    cd libpng-1.6.18
    ./configure
    make
    make install
  EOC
  not_if 'test -e /usr/local/lib/libpng16.so'
end

tmp_dir = '/tmp/phantomjs'

execute "git clone git://github.com/ariya/phantomjs.git #{tmp_dir}" do
  not_if "test -d #{tmp_dir}"
end

execute 'git fetch && git clean -xfd' do
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
