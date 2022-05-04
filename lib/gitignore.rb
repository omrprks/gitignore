require "getoptlong"
require "open-uri"

class Gitignore
  VERSION = "1.0.0"
  BASE_URL = "https://www.toptal.com/developers/gitignore"
  API_URL = "#{Gitignore::BASE_URL}/api"

  DEFAULT_FILENAME = ".gitignore"

  OPTIONS = [
    [
      '--list',
      '-l',
      GetoptLong::NO_ARGUMENT,
      'displays available gitignore profiles',
    ],
    [
      '--destroy',
      '-d',
      GetoptLong::NO_ARGUMENT,
      'removes existing .gitignore file',
    ],
    [
      '--out',
      '-o',
      GetoptLong::REQUIRED_ARGUMENT, "output file name (default: \"#{Gitignore::DEFAULT_FILENAME}\")",
    ],
    ['--overwrite', GetoptLong::NO_ARGUMENT, 'overwrite current .gitignore file (if exists)'],
    ['--show',    '-s', GetoptLong::NO_ARGUMENT, 'display contents of .gitignore file in current directory'],
    ['--version', '-V', GetoptLong::NO_ARGUMENT, 'display version information'],
    [
      '--help',
      '-h',
      GetoptLong::NO_ARGUMENT,
      'displays this help ("-h" for short message)',
    ],
  ]

  attr_accessor :out
  attr_accessor :overwrite
  attr_reader :opts

  def initialize()
    @overwrite = false
    @out = Gitignore::DEFAULT_FILENAME

    @opts = Gitignore::OPTIONS.map do |opt|
      temp = opt.clone
      temp.pop
      temp
    end
  end

  public
  def list
    data = open(API_URL + '/list').read
    puts data
  end

  def show
    puts File.open(@out, 'r').read if File.exist?(@out)
  end

  def generate(types)
    data = open(Gitignore::API_URL + '/' + types.join(',')).read
    file = File.open(@out, (@overwrite ? "w" : "a") + "b")
    file.write(data)
  end

  def destroy
    File.delete(@out) if File.file?(@out)
  end

  def usage
    $parsedOptions = Gitignore::OPTIONS.map { |opt|
      hasArg = opt[opt.length - 2] != GetoptLong::NO_ARGUMENT
      "#{(opt[1] == 0 ? '' : "#{opt[1]}, ").rjust(6)} #{(opt[0] + (hasArg ? ' [arg]' : '')).ljust(12)} #{opt[opt.length - 1]}"
    }

"Usage: gitignore [OPTION] args
Generate .gitignore file using gitignore.io API.

Output will be appended if .gitignore file exists in current directory.

options:
#{$parsedOptions.join("\n")}

args:
  [ignore profiles] (ex: Ruby, Rails, C, C++)

example:
  $ gitignore Ruby Rails VisualStudioCode"
  end
end
