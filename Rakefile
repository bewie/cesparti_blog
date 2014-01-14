# Adopted from Tate Johnson's Rakefile
# http://github.com/tatey/tatey.com/blob/master/Rakefile

require 'yaml'

task :default => :server

desc 'Build site with jekyll'
task :build do
  jekyll('build')
end

desc 'clean _site'
task :clean do
  sh 'rm -rf _site'
end

desc 'Start server with --auto'
task :server do
  jekyll('serve -w')
end

desc 'Build and deploy'
task :deploy do
  sh "rsync -ah --progress _site/ tigrou.bewie.org:/home/laurent/www/wt_blog/"
end

desc 'Make a new post'
task :post, :name do |t, args|
  if args.name then
    template(args.name)
  else
    puts "Name required"
  end
end

def template(name)
  t = Time.now

  filename = "_posts/" + t.strftime("%Y-%m-%d-") + name.downcase.gsub( /[^a-zA-Z0-9_\.]/, '-') + '.markdown'
  if File.exists? filename then
    puts "Post already exists: #{filename}"
    return
  end
  File.open(filename, "wb") do |f|
    f.puts YAML.dump({'layout' => 'post', 'title' => name, 'time' => t.strftime("%Y-%m-%d %H:%M")})
    f.puts "---"
  end
  puts "created #{filename}"
end

def jekyll(opts = '')
  sh 'jekyll ' + opts
end


