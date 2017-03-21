class Gitignore
	@@URL = "https://www.gitignore.io/api/"

	public
	def self.list
		$TEMPLATES = Dir["#{File.dirname(__FILE__)}/**/*.gitignore"]
		# (0..$TEMPLATES.length - 1).step(2).each do |_|
		# 	puts File.basename($TEMPLATES[_], File.extname($TEMPLATES[_])) + " " +
		# 		File.basename($TEMPLATES[_ + 1], File.extname($TEMPLATES[_ + 1]))
		# end
		$TEMPLATES.each { |_| puts File.basename(_, File.extname(_)) }
	end

	def self.show(_) puts File.open(_, 'r').read if File.exist?(_) end
	def self.url() @@URL end
end