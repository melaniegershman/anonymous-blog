# show all entries
get '/entries' do
  @entries = Entry.all.order(:title)
  # binding.pry
  erb :index
end

# take us to a new entry form
get '/entries/new' do
  erb :'/entries/new'
end

# take us to edit an entry form
get '/entries/:entry_id/edit' do
  @entry = Entry.find_by(id: params[:entry_id])
  erb :'/entries/edit'
end


# show a particular entry by ID
get '/entries/:entry_id' do
  @entry = Entry.find_by(id: params[:entry_id])
  @tags = @entry.tags
  # binding.pry
  erb :'/entries/show'
end

# add tags to an entry
post '/entries/:entry_id/entry_tags' do
  entry = Entry.find_by(id: params[:entry_id])
  tags = params[:tags].chomp.split(",")

  tags.each do |tag_name|
    entry.tags.find_or_create_by(tag: tag_name)
  end

  redirect "/entries/#{entry.id}"
end

# create a new entry
post '/entries' do
  @entry = Entry.new(params[:entry])
  if @entry.save
    erb :'/entries/show'
  else
    redirect '/'
  end
end

# https://gist.github.com/victorwhy/45bb5637cd3e7e879ace

# edit an existing entry
put '/entries/:entry_id' do
  puts "I want to save a new post"
  @entry = Entry.find_by(id: params[:entry_id])
  puts "my post is id:#{@entry.id} title: #{@entry.title}"
  @entry.update(params[:entry])
  redirect "/"
end

# delete an existing entry
delete '/entries/:entry_id' do
  @entry = Entry.find_by(id: params[:entry_id]).destroy
  redirect "/"
end



