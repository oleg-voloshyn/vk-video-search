require('sinatra')
require('sinatra/reloader')
require('vkontakte_api')
require('./lib/figaro')

before do
  @vk = VkontakteApi::Client.new(Figaro.env.vk_token)
end

get('/') do
  slim(:index)
end

get('/audios') do
  slim(:audios)
end

get('/videos') do
  slim(:videos)
end

post('/videos') do
  @result = @vk.video.search(params)
  slim(:result)
end
