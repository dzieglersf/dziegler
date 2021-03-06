# app/models/post.rb

class Post
	extend ActiveModel::Naming 
	include ActiveModel::Conversion
	attr_accessor :blog, :title, :body, :pubdate

	def initialize(attrs={})
		attrs.each do |k,v| send("#{k}=", v) end
	end

	def persisted? 
		false
	end

	def publish(clock=DateTime) # parameter injection
		self.pubdate = clock.now
		blog.add_entry(self)
	end

end
