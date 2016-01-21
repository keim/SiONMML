require 'json'

Dir.mkdir('./mmltalks') if !File.exist?('./mmltalks')

list = JSON.parse(File.read('./mmltalks_mml.json', :encoding => Encoding::UTF_8))

list.each do |o|
  date = o['post_date'].gsub(/^(\d+)-(\d+)-(\d+).*/, '\1\2\3')
  tag = o['tags'].join(',')
  title = o['title'].gsub(/[\/\s]+/, '_').gsub(/['"<>?!]+/,'')
  filename = "./mmltalks/#{date}_#{o['author']}_#{title}.sionmml"
  File.write(filename, o['mml'])
  p filename
end


