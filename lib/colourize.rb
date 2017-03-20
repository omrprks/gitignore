class String
	public
	def red() colourize(31) end
	def green() colourize(32) end
	def yellow() colourize(33) end
	def blue() colourize(34) end
	def lightblue() colourize(36) end
	def pink() colourize(35) end

	private
	def colourize(_) "\e[#{_}m#{self}\e[0m" end
end