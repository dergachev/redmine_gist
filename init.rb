require 'redmine'

Redmine::Plugin.register :redmine_gist do
  name 'Redmine Gist embed'
  author 'Alex Dergachev'
  description 'Defines macro to embed Github Gists into Redmine'
  version '0.1.0'

  Redmine::WikiFormatting::Macros.register do
    desc "Embed snippet from gist.github.com. Usage:\n\n  !{{gist(id,filename)}} or !{{gist(url)}}\n\n" +
         "Example: \n\n  !{{gist(1174028)}}\n\n" + 
         "Example: \n\n  !{{gist(1174028,example1.rb)}}\n\n" + 
         "Example: \n\n  !{{gist(https://gist.github.com/1174028#example1.rb)}}\n\n"
    macro :gist do |obj, args|
      return if args.empty?
      
      #support alternative syntax: {{gist(https://gist.github.com/1015365#file_directory)}}
      if args[1].blank? 

	# stricter filename matching necessary to avoid redmine bug http://www.redmine.org/issues/11633
        # matches = args[0].match('^https://gist\.github\.com/(\d+)#?(.*?)\s*$');
        matches = args[0].match('https://gist\.github\.com/(\d+)#?([a-zA-Z0-9_.-]+)?');
	if matches
          args[0] = matches[1]
	  args[1] = matches[2]
	end
      end

      GIST = args[0] 
      FILE = args[1].blank? ? '' : '?file=' + args[1]

      output = javascript_tag(nil, :src=>"http://gist.github.com/#{GIST}.js#{FILE}") 
      return output.html_safe
    end

  end
end
