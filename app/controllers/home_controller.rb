class HomeController < ApplicationController
  # before_filter :verify_authenticity_token  

  def index
  	if !current_member
  		redirect_to members_sign_in_path
  	end

  	@grades = Grade.all
  	@categories = Category.all
  	@content = Content.new
  end

  def upload_content
  	c = Content.new
	c.upload_content(params)
  	c.save
	@content = c

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
  	end
  end

  def topic_articles
  	a = Article.new
  	a.title = params[:title]
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

  def site_categories
  	c = Category.new
  	c.name = params[:name]
  	c.save

  	Grade.all.each do |g|
  		c.grades << g
  	end

  	redirect_to request.referer

  end

  def delete_item
  	if params[:category_id]
  		# Category.find(params[:category_id]).destroy
  		@category_id = params[:category_id]
  	elsif params[:topic_id]
  		# Topic.find(params[:topic_id]).destroy
  		@topic_id = params[:topic_id]
  	elsif params[:article_id]
  		# Article.find(params[:article_id]).destroy
  		@article_id = params[:article_id]
  	end
  	
  	respond_to do |format|
	    format.js
	  end

  end
end
