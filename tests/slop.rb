#!/usr/bin/env ruby

require "slop"
 
opts = Slop.parse do
  on "-v", "--version" do
    puts "my-app v0.0.2"
  end
 
  command 'hello' do
    run do |opts, args|
      puts "Hello #{args.shift}"
    end
  end
 
  command 'goodbye' do
    on 'n=', 'name='
 
    run do |opts, args|
      puts "Goodbye #{opts[:name]}"
    end
  end
end