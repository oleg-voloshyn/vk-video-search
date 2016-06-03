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

post('/audios') do
  @audio = @vk.audio.search(params)
  @audio.shift
  slim(:audio_result)
end

post('/videos') do
  @video = @vk.video.search(params)
  slim(:video_result)
end
