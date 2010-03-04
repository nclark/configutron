require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
RAILS_ROOT = '/rails_root/'
RAILS_ENV = 'test'

describe Configutron do
  include FakeFS::SpecHelpers
  after(:each) { reset! }
  
  describe "module methods" do
    describe ".constant=" do
      it "should alias the Configutron constant to something you actually want to use" do
        Configutron.constant = 'App'
        Configutron.should == App
      end
    end
  end

  describe "settings file" do
    context 'one file per env' do
      before(:each) { mock_test_yml }
      
      specify 'is loaded from config/settings/#{RAILS_ENV}.yml' do
        Configutron.file.should == 'test.yml'
      end      
    end
    
    context 'one file for the whole application' do
      before(:each) { mock_settings_yml }
      
      specify 'is loaded from config/settings.yml based on the RAILS_ENV' do
        Configutron.file.should == 'settings.yml'
      end
    end
    
    context 'that is missing' do
      specify 'raises an IOError' do
        lambda { Configutron.snoop_dogg }.should raise_error(IOError, "Create either config/settings.yml or config/settings/RAILS_ENV.yml")
      end
    end
  end

  describe "settings" do
    before(:each) { mock_test_yml }
        
    describe "non-nested settings" do
      specify "strings can be accessed" do
        Configutron.my_string.should == 'string'
      end
      
      specify "integers can be accessed" do
        Configutron.my_integer.should == 1
      end
      
      specify "arrays can be accessed" do
        Configutron.my_array.should == [1,2,3,4]
      end
      
      specify "hashes can be accesed" do
        Configutron.my_hash.one.should == 1
        Configutron.my_hash.two.should == 2
      end
    end
    
    describe "nested settings" do
      specify "can be accessed" do
        Configutron.two.three.should == 3
      end
      
      describe "nested settings" do
        specify "can be accessed" do
          Configutron.four.five.six.should == 6
        end
      end
    end    
  end
end
