class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :populate_sidebar
  
  def populate_sidebar
    @recurring = Post.group('lower(title)').order('count_id desc').count('id').delete_if{|x, y| y < 3 || x.blank? }
  end
  
end
