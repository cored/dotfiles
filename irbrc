history = "History?"
exit
[1,2,3].inspect
quit
un_moment = "Getting there"
String.local_methods
class Test
def hello
end
Test.local_methods
test = Test.new
test.local_methods
h = "hello"
h.local_methods
t = Test.new
t.local_methods
pp String
[1,2,3,4,5]
array = %w[1,2,2,4,5]
pp array
alias
alias q exit
q
'rake'.sub 'r','s'
48.09*35
Math.local_methods
[1,2,3,4,5].max
Time.date
Date.now
Date
Date.new
a = Date.new
a.time
a.local_methods

a.strftime
test = "test"
test1 ||= test
test = nil
File.basename($0)
#{RUBY_VERSION}
"
\q
"#{RUBY_VERSION}"
"#{RUBY_RELEASE_DATE}"
"#{RUBY_PLATFORM}"
File.dirname(__FILE__)
$:
$:.unshift
$:.unshift File.dirname(__FILE__)
$:.unshift 
$:.unshift File.dirname(__FILE__)+"/../lib"
153*20
server_list = ["mongrel", "webrick", "console"]
server_list.join(", ")
145*20
LANGUAGES = {
:english => "en"}
LANGUAGES[:english]
192%2
gem 'merb-core'
gem 'merb-core' = 1.0.4
gem 'merb-core', "=0.1.4"
gem 'merb-core', "= 0.1.4"
gem "merb-core" "= 1.0.4"
gem "merb-core"
Dir[/*/]
Dir
Dir.methods
Dir['**/*.*']
Dir['**/*.*'].each do |file|
puts "Pluging#{file}"
'#{h}'
'h'
'you'+h
digit_range = 0..9
digit_range
digit_range.class
digits = digit_range.to_a
digits.map { |num| num+1 }
