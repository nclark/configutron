require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
RAILS_ROOT = File.join(File.dirname(__FILE__), 'fake_rails_root')
RAILS_ENV = 'test'

describe Configutron do
  before do
    @fixture_path = File.expand_path(File.dirname(__FILE__) + "/fake_rails_root/config/settings/test.yml")
  end
  
  describe "module methods" do
    describe ".constant=" do
      it "should alias the Configutron constant to something you actually want to use" do
        Configutron.constant = 'App'
        Configutron.should == App
      end
    end
  end
  
  describe "settings file" do      
    before do
      Configutron.should_receive(:settings_path).and_return(@fixture_path)
    end
    
    specify "is loaded from config/settings based on the RAILS_ENV" do
      lambda { Configutron.some_variable }.should_not raise_error
    end
  end

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
