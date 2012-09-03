class BlogController < ApplicationController
  def index
  	@blog = Blog.new
  	post1 = @blog.new_post
  	post1.title = "Amazing new idea"
  	post1.body = "I just thought of this idea tonight!"
  	post1.publish
  	post2 = @blog.new_post( title: "Idea lost forever!" )
  	post2.body = "I spilled Jamesons on the keyboard and I'll never get the idea back."
  	post2.publish
  end

end
