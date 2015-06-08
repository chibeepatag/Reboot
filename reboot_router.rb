require 'net/http'

uri = URI('http://192.168.1.200/do_cmd.html')

params = {
  :CMD => 'SYS_CONF',
  :GO => 'misc.htm',
  :CCMD => '0'
}

req = Net::HTTP::Post.new(uri)
req.set_form_data params
req.basic_auth 'admin', 'admin'

res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end

puts res.code
puts res.message
puts res.body