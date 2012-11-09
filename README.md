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

Redmine plugin adding a {{gist}} macro that embeds Github Gists into Redmine.

After installing the plugin, you can use the following syntax in a Redmine page to embed the gist located at https://gist.github.com/4033291:

If you like to type out Gist IDs, possibly with a specific file: 

* !{{gist(4033291)}} 
* !{{gist(4033291,example1.rb)}}

Private gists work too:

* !{{gist(https://gist.github.com/28c72d38da181f38bbb9)}}

An alternative syntax is provided if you'd like to just paste in the Gist URL:

* !{{gist(https://gist.github.com/4033291)}}

Be careful about using the URL syntax when embedding specific files. If the
filename has any capital letters (eg "README.md"), the gist URL will downcase
them ("https://gist.github.com/4033291#file_readme.md"), which breaks the
embedding logic, which needs to extracting the original filename. Instead,
provide the filename as second argument:

* !{{{gist(https://gist.github.com/4033291,README.md)}}


Notes
-----

Tested on Redmine 1.2.1, though should probably work with newer versions too.

License
-------

This plugin is licensed under the GNU GPL v2.  See LICENSE.txt for details.
