configutron
===========

configutron is a rails gemplugin for simple, application wide settings. there are tons of projects like this; each does it differently, and this is how i like to do it. all the ones I tried seemed too heavy handed. i am publishing this as a convenience for myself to use in projects i work on.

usage
-----

use the gem in your rails project:

    Rails::Initializer.run do |config|
	  config.gem 'configutron'
	end

you have two options for specifying settings. 

1.  one file (_config/settings.yml_) 
2.  one file per environment (_config/settings/environment\_name.yml_)

option 1 takes presedence; that is, if _config/settings.yml_ exists, it will be used, and the _config/settings_ directory will be ignored.

config/settings.yml
-------------------
this option uses one file for the application, with settings for each 
environment nested under the environment's name, like database.yml.

add your variables to that file:

    % echo "--- \ndevelopment: \n  variable: value\n" > config/settings.yml

try it out:

    % ./script/console 
    Loading development environment (Rails 2.3.5)
    $ >> Configutron.variable
    % => "value

config/settings/RAILS\_ENV.yml
------------------------------

create a folder *config/settings*. configutron will be available for each environment 
that has a corresponding yaml file in that directory.

    % mkdir config/settings

add your variables to those files:

    % echo "--- \nvariable: value\n" > config/settings/development.yml

try it out:

    % ./script/console
    Loading development environment (Rails 2.3.5)
    >> Configutron.variable
    => "value"

name it something easier to type:
---------------------------------
back in _environment.rb_

    Rails::Initializer.run do |config|
      config.gem 'configutron'
    end
    
    Configutron.constant = 'App'

try it out:

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
