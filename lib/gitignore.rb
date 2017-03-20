class Gitignore
	@@url = "https://www.gitignore.io/api/"

	public
	def self.list
		Dir[File.dirname(__FILE__) + "/**/*.gitignore"].each { |_| puts File.basename(_) }
	end

	def self.show(_) puts File.open(_, 'r').read if File.exist?(_) end
	def self.url() @@url end
end