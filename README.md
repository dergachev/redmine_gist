Gist Embed Redmine Plugin
=========================

Redmine plugin adding a {{gist}} macro that embeds Github Gists into Redmine.

Usage
-----

Redmine plugin adding a {{gist}} macro that embeds Github Gists into Redmine.

To embed the public gist https://gist.github.com/4033291 : `{{gist(4033291)}}` 

You can embed a specific file from a gist: `{{gist(4033291,README.md)}}`

Private gists work too: `{{gist(28c72d38da181f38bbb9)}}`

You can also just paste in the gist URL: `{{gist(https://gist.github.com/4033291)}}`

Be careful about using the URL syntax when embedding specific files. If the
filename has any capital letters (eg "README.md"), the permalink gist generates will downcase
the filename (eg "https://gist.github.com/4033291#file_readme.md"), preventing the plugin
from extracting the original filename and breaking the embedding. Instead,
provide the filename as second argument: `{{gist(https://gist.github.com/4033291,README.md)}}`

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

Tested on Redmine 1.3, though hopefully compatible with future versions too.

License
-------

This plugin is licensed under the GNU GPL v2.  See LICENSE.txt for details.
