version = (node[:phantomjs] && node[:phantomjs][:version]) || '2.1.1'

package 'libfontconfig' if "ubuntu" == node[:platform]

execute 'sudo yum groupinstall "Japanese Support" -y' if "redhat" == node[:platform]

execute 'phantomjs' do

  user 'root'
  arch = node[:kernel][:machine] || 'x86_64'
  command <<-"EOH"
    curl -L --output /usr/local/src/phantomjs-#{version}-linux-#{arch}.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-#{version}-linux-#{arch}.tar.bz2 && \
    tar jxfv /usr/local/src/phantomjs-#{version}-linux-#{arch}.tar.bz2 -C /usr/local/src/ &&
    ln -s /usr/local/src/phantomjs-#{version}-linux-#{arch}/bin/phantomjs /usr/bin/phantomjs
  EOH

  not_if 'phantomjs  --version'
end
