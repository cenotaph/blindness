class PostsController < InheritedResources::Base
  has_scope :page, :default => 1
  respond_to :html, :rss
  before_filter :authenticate_user!, :only => [:create, :update, :new, :edit, :destroy]
  
  def edit
    @post = Post.friendly.find(params[:id])
    render :template => 'posts/forms/' + @post.mytype
  end
  def filtered
    @posts = Post.where(['lower(title) = ?', params[:id]]).page(params[:page]).per(10)
    @filtered = params[:id]
    render :action => 'index'
  end
  

  def new
    @post = Post.new
    if params[:type]
        render :template => 'posts/forms/' + params[:type]
    else
        render :template => 'posts/forms/post'
    end
  end
  
  def search
    if params[:searchterm].strip.size < 4
      flash[:error] = 'You must enter a longer search term.'
      redirect_to request.referer
    else
      @posts = Post.where('title LIKE "%' + params[:searchterm].strip + '%" OR description LIKE "%' + params[:searchterm].strip + '%"').page(params[:page]).per(10)
      @filtered = 'Results for <em>' + params[:searchterm].strip + '</em>'
      render :action => 'index'
    end
  end
  
  def show
    if params[:id] == 'search'
      @posts = Post.where('title LIKE "%' + params[:searchterm].strip + '%" OR description LIKE "%' + params[:searchterm].strip + '%"').page(params[:page]).per(10)
      @filtered = 'Results for <em>' + params[:searchterm].strip + '</em>'
      render :action => 'index'
    else
      @post = Post.friendly.find(params[:id])
    end
  end
  
  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :user_id, :localimage, :localfile, :url, :description, :the_type)) 
      flash[:notice] = 'Post updated'
      redirect_to @post
    end
  end
  protected
  
  def permitted_params
    params.permit(:post => [:title, :user_id, :localimage, :localfile, :url, :description, :the_type])
  end
  
end