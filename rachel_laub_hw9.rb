#!/usr/bin/env ruby
# Homework 6 Python to ruby
# Grabs file through a url and 

require 'open-uri'
url = ARGV[0]


def help_function()
    puts "Usage is ./rachel_laub_final.rb <file input>"
end


def get_errors(url)
    #reads the url
    file = open(url).read
    data = Array[]
    i = 0

    #grabs the error
    file.scan(/(?:\[.*?\]) (?:\[error\]) (?:\[.*?\]) (.*)/) do |match|
        data[i] = match
        i += 1
    end

    #counts the errors
    counts = Hash.new 0
    data.each do |match|
        counts[match] += 1
    end

    #prints the errors
    puts "*** Top 25 Errors***"
    counts.keys.sort_by{|key| counts[key]}.reverse.each_with_index { |key, index| puts "Count: #{counts[key]} Error: #{key}" if index < 25 }
end


unless ARGV.length == 1
    help_function()
    exit(1)
end


puts "Fetching file from #{ARGV[0]}"
get_errors(url)
exit(0)
