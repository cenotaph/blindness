class PostsController < InheritedResources::Base
  has_scope :page, :default => 1
  
  def filtered
    @posts = Post.where(['lower(title) = ?', params[:id]]).page(params[:page]).per(10)
    @filtered = params[:id]
    render :action => 'index'
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
  
end