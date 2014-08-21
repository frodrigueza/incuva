class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, only: [:edit, :new]

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
  end
  
  def is_admin
    if !current_member.is_admin
      redirect_to root_path
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    current_member.new_download(params[:id])
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit

  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to root_path }
        format.json { render action: 'show', status: :created, location: @content }
      else
        format.html { render action: 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      @content.update_content(params[:content])
      if @content.update(content_params)
        format.html { redirect_to root_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params[:content].permit(:name, :description)
    end
end
