class ArticlesController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  layout "backend", only:  [ :index, :new, :show, :edit, :create, :update, :destroy ]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    articles_scope = Article.all
    case search_params[:type]
    when "Fullname"
      articles_scope = Article.by_fullname(search_params) if (search_params[:type] && search_params[:textsearch])
    when "Title"
      articles_scope = Article.by_title(search_params) if (search_params[:type] && search_params[:textsearch])
    when "Description"
      articles_scope = Article.by_description(search_params) if (search_params[:type] && search_params[:textsearch])
    end

    @articles = smart_listing_create :articles, articles_scope, partial: "articles/list",
                                          default_sort: {title: "asc"}
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.account.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to '/articles', notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description, :account_id)
    end

    def search_params
      params.permit(:type, :textsearch)
    end
end
