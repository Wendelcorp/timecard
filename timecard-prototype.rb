require 'optparse'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

def get_projects
    uri = URI('http://localhost:3001/projects')
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
        data = JSON.parse(res.body)
        data.each do |project|
            puts project
        end
    end
end

def new_project(options)
    uri = URI('http://localhost:3001/projects')
    res = Net::HTTP.post_form(uri, options)
    puts res.body if res.is_a?(Net::HTTPSuccess)
    
end

def hello_world
    puts "hello world"
end
# option = {}

# parser = OptionParser.new do |parser|
#   parser.on("-p", "--name PROJECT_NAME", "Replace project name") do
#     new_project(name: "hello")
#   end
# # 
# end
# parser.parse!(into: option)
# puts option


options = {}

parser = OptionParser.new do |parser|
  parser.on("-p", "--name NAME", "Render n random jokes") do |project|
    options[:name] = project
    new_project(options)
  end
  parser.on("list-projects") do
    get_projects
  end
end

parser.parse!(into: options)