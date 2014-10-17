require 'optparse'


opts = OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end

  opts.on_tail("--version", "Show version") do
    puts OptionParser::Version.join('.')
    exit
  end

  # opts.parse!(args)
end


p options
p ARGV