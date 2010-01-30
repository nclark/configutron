configutron
===========

configutron is a rails gemplugin for simple, application wide configuration variables specific to a rails environment. there are a grip of projects like this; each does it differently, and this is how i like to do it. all the ones I tried seemed too heavy handed. i am publishing this as a convenience for me to use in projects i work on.

usage
-----

use the gem in your rails project:

    Rails::Initializer.run do |config|
	  config.gem 'configutron'
	end

create a folder *config/settings* and a file named after each of your rails environments:

    % mkdir config/settings
    % touch config/settings/development.yml config/settings/test.yml config/settings/production.yml

add your variables to those files:

    % echo "--- \nvariable: value\n" > config/settings/development.yml

make sure it works:

    % ./script/console
    Loading development environment (Rails 2.3.5)
    >> Configutron.variable
    => "value"

name it something easier to type:

    Rails::Initializer.run do |config|
      config.gem 'configutron'
    end
    
    Configutron.constant = 'App'

then back in the console:

    % ./script/console
    Loading development environment (Rails 2.3.5)
    >> App.variable
    => "value"

inspiration
-----------
* [Christopher J. Bottaro](http://github.com/cjbottaro/app_config/)'s app_config
* [Brian Smith](http://swig505.com)

note on patches/pull requests
-----------------------------
* fork the project.
* make your feature addition or bug fix.
* add tests for it. this is important so i don't break it in a
  future version unintentionally.
* commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself i can ignore when i pull)
* send me a pull request. bonus points for topic branches.


copyright
---------
copyright (c) 2010 neal clark. See LICENSE for details (MIT License).
