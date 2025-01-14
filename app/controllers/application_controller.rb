class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #load edit form
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

    patch '/recipes/:id' do #edit action
      @recipes = Recipe.find_by_id(params[:id])
      @recipes.name = params[:name]
      @recipes.ingredients = params[:ingredients]
      @recipes.save
      redirect to "/recipes/#{@recipe.id}"
    end

    get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end

    delete '/recipes/:id' do #delete action
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.delete
      redirect to '/recipes'
    end
end
