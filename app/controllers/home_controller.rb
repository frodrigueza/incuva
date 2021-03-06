class HomeController < ApplicationController
  before_action :require_login
  before_action :is_admin, only: [:members]

  def require_login
    if !current_member
      redirect_to members_sign_in_path
    end
  end

  def is_admin
    if !current_member.is_admin
      redirect_to root_path
    end
  end

  def about_us

  end

  def join_us
    
  end

  def our_team
    
  end

  def contact
    
  end

  def contact_admin

    mail = Mail.new do
      from    'mikel@test.lindsaar.net'
      to      'hualoclothing@gmail.com'
      subject 'This is a test email'
      body    'hola'
    end

    mail.delivery_method :sendmail

    # HomeMailer.contact_admin(1).deliver
    redirect_to request.referer
  end

  def update_member_form
    
  end

  def update_member
    member = current_member
    member.update_fields(params)

    redirect_to request.referer
  end

  def index
  	@grades = Grade.all
  	@categories = Category.all
  	@content = Content.new
  end

  def create_notice
    @notice = Notice.new
    @notice.title = params[:title]
    @notice.body = params[:body]
    @notice.save

    respond_to do |format|
      format.html { redirect_to(request.referer, notice: "Noticia creada") }
    end
  end

  def delete_notice
    Notice.find(params[:notice_id]).destroy

    redirect_to request.referer
  end

  def upload_content
  	c = Content.new
  	c.upload_content(params)
    	c.save

  	respond_to do |format|
  		format.html { redirect_to request.referer }
  		format.js
  	end
  end

  def delete_content
  	c = Content.find(params[:content_id])
  	@content = c
  	c.delete_blob
  	c.destroy
  	
  	respond_to do |format|
  		format.js
      format.html { redirect_to(request.referer, notice: "Contenido eliminado") }
  	end
  end

  def topic_articles
  	a = Article.new
  	a.title = params[:title]
    a.description = params[:description]
  	a.save
  	@topic = Topic.find(params[:topic_id])
  	@topic.articles << a

  	redirect_to request.referer
  end

  def grade_topics
  	t = Topic.new
  	t.title = params[:title]
  	t.save
  	@grade = Grade.find(params[:grade_id])
  	@category = Category.find(params[:category_id])
  	@grade.topics << t
  	@category.topics << t

	redirect_to request.referer
  end

  def resource
  	@topic = Topic.find(params[:topic_id])

  	respond_to do |format|
	    format.js
	  end
  end

  def members
    @members = Member.all

    respond_to do |format|
      format.html
      format.csv { render :csv => @members }
    end
  end

  def material
    @contents = Content.where(content_type: params[:format]).reverse
  end

  def site_categories
  	c = Category.new
  	c.name = params[:name]
  	c.save

  	12.times do |t|
      c.grades << Grade.create(level: t+1)
    end

  	redirect_to request.referer

  end

  def delete_item
  	if params[:category_id]
  		Category.find(params[:category_id]).destroy
  		@category_id = params[:category_id]
  	elsif params[:topic_id]
  		Topic.find(params[:topic_id]).destroy
  		@topic_id = params[:topic_id]
  	elsif params[:article_id]
  		Article.find(params[:article_id]).destroy
  		@article_id = params[:article_id]
  	end
  	
  	respond_to do |format|
	    format.js
	  end

  end
end
