require 'rails_helper'

describe MoviesController, type: :controller do

  describe 'GET #index' do
    it "populates an array of movies ordered by created_at DESC" do
      movies = create_list(:movie, 3) 
      get :index
      expect(assigns(:movie))
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested movie to @movie" do
      movie = create(:movie)
      get :edit, params: { id: movie }
      expect(assigns(:movie)).to eq movie
    end

    it "renders the :edit template" do
      movie = create(:movie)
      get :edit, params: { id: movie }
      expect(response).to render_template :edit
    end
  end

end