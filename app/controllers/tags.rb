#show all tags
get '/tags' do
  @tags = Tag.all.reverse
  erb :'tags/index'
end

# show all entries with a given tag TODO: needs some work... not doing what it's supposed to
get '/tags/:tag_id' do
  @tag = Tag.find_by(id: params[:tag_id])
  erb :'tags/show'
end

