require 'redmine'

Redmine::Plugin.register :redmine_gist do
  name 'Redmine Gist embed'
  author 'Alex Dergachev'
  description 'Defines macro to embed Github Gists into Redmine'
  version '0.1.0'

  Redmine::WikiFormatting::Macros.register do
    desc "Embed snippet from gist.github.com. Usage:\n\n  !{{gist(4033291,README.md)}} or !{{gist(url)}}\n\n" +
         "Example: \n\n  !{{gist(1174028)}}\n\n" + 
         "Example: \n\n  !{{gist(1174028,example1.rb)}}\n\n" + 
         "Example: \n\n  !{{gist(https://gist.github.com/1174028#example1.rb)}}\n\n"
    macro :gist do |obj, args|
      return if args.empty?

      # Public multifile gist: https://gist.github.com/4033291
      # Private multifile gist: https://gist.github.com/28c72d38da181f38bbb9

      # URL to README.md in a public multifile: https://gist.github.com/4033291#file_readme.md


      matches = args[0].match('https://gist\.github\.com/([a-zA-Z0-9]+)(#file_([^">]+))?');
      if matches
# raise [args].to_yaml
        args[0] = matches[1]
        # XXX: README.md is represented as "https://gist.github.com/4033291#file_readme.md".
        #   The lowercasing makes it impossible to extract the original filename,
        #   which is necessary to embed just that file.
        # If no filename provided as explicit argument, extract it from URL:
        if matches[3] && args[1].blank?
          args[1] = matches[3]
        end

        # XXX: Because of Redmine 1.x bug http://www.redmine.org/issues/11633, macro
        # args that look like external links are passed as follows:
        #   {{gist(https://gist.github.com/4033291#file_readme.md)}}
        #     arg[0]: <a class="external" href="ARG1">ARG1</a> 
        # It's even worse if there's a comma inovolved:
        #   {{gist(https://gist.github.com/4033291,README.md)}}
        #     arg[0]:   <a class="external" href="ARG1
        #     arg[1]:   ARG2">ARG1
        #     arg[2]:   ARG2</a>
        # Workaround:
        if args[2] && args[2].match("</a>$")
          args[1] = args[2].match("^(.*)</a>$")[1]
        end
      end
      
      GIST = args[0] 
      FILE = args[1].blank? ? '' : '?file=' + args[1]


      output = javascript_tag(nil, :src=>"http://gist.github.com/#{GIST}.js#{FILE}") 
      return output.html_safe
    end
  end
end
