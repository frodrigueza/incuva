class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, only: [:edit, :new]
  # GET /articles
  # GET /articles.json
  def index
    
  end
  
  def is_admin
    if !current_member.is_admin
      redirect_to root_path
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @topic = Topic.find(params[:format])
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @topic = @article.topic
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    topic = Topic.find(params[:article][:topic_id])
    topic.articles << @article

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path}
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to root_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
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
      params[:article].permit(:title, :description, :article)
    end
end
