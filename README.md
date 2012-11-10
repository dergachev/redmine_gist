Gist Embed Redmine Plugin
=========================

Redmine plugin adding a {{gist}} macro that embeds Github Gists into Redmine.

Usage
-----

Redmine plugin adding a {{gist}} macro that embeds Github Gists into Redmine.

To embed a public gist: https://gist.github.com/4033291: `{{gist(4033291)}}` 

Or just a specific file: `{{gist(4033291,example1.rb)}}`

Private gists work too: `{{gist(https://gist.github.com/28c72d38da181f38bbb9)}}`

Or if you prefer copying and pasting the URL: `{{gist(https://gist.github.com/4033291)}}`

Be careful about using the URL syntax when embedding specific files. If the
filename has any capital letters (eg "README.md"), the gist URL will downcase
them ("https://gist.github.com/4033291#file_readme.md"), which breaks the
embedding logic, which needs to extracting the original filename. Instead,
provide the filename as second argument: `{{{gist(https://gist.github.com/4033291,README.md)}}`

Installation
------------

1. cd PATH_TO_REDMINE/vendor/plugins 
2. git clone git://github.com/dergachev/redmine_gist.git gist
2. (restart Redmine web server)

More info
----------
![Screenshot](http://dl-web.dropbox.com/u/29440342/screenshots/Screen%20Shot%202012-11-09%20at%206.53.36%20PM.png)

If you'd like to have a wiki page documenting this plugin, see USAGE.textile.

Notes
-----

Tested on Redmine 1.2.1, though should probably work with newer versions too.

License
-------

This plugin is licensed under the GNU GPL v2.  See LICENSE.txt for details.
