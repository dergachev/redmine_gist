Gist Plugin
===========

Redmine plugin adding a {{gist}} macro that embeds Github Gists into Redmine.

Installation
------------

1. cd PATH_TO_REDMINE/vendor/plugins 
2. git clone git://github.com/dergachev/redmine_gist.git gist
2. (restart Redmine web server)

Usage
-----

After installing the plugin, you can use the following syntax in a Redmine page
to embed the gist located at https://gist.github.com/1174028:

If you like to type out Gist IDs: {{gist(1174028)}} 

Embed just a specific file: {{gist(1174028,example1.rb)}} 

If you prefer to copy and paste: {{gist(https://gist.github.com/1174028)}}

And with a filename: {{gist(https://gist.github.com/1174028#example1.rb)}}

Notes
-----

Currently Gist doesn't seem to support embedding private Gists. Too bad!
Tested on Redmine 1.2.1, though should probably work with newer versions too.

License
-------

This plugin is licensed under the GNU GPL v2.  See LICENSE.txt for details.
