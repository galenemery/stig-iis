require 'spec_helper'

describe 'stig-iis::default' do

  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  
  it 'installs IIS' do
    describe windows_feature('IIS-WebServer') do
      it { should be_installed }
      end
  end
  
  it 'listens on port 80' do
    describe port(80) do
      it { should be_listening }
      end
  end
  
  it 'has a website' do
    describe file('C:\inetpub\wwwroot\iisstart.htm') do
      it { should be_file }
      end
  end

end