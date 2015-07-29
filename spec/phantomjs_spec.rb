require 'spec_helper'

describe command('phantomjs --version') do
  its(:stdout) { should match /2.0/ }
end
