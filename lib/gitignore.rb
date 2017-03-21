class Gitignore
	@@URL = "https://www.gitignore.io/api/"

	public
	def self.list
		Dir[File.dirname(__FILE__) + "/**/*.gitignore"].each do
			|_| puts File.basename(_, File.extname(_))
		end
	end

	def self.show(_) puts File.open(_, 'r').read if File.exist?(_) end
	def self.url() @@URL end
end