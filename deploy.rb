#!/usr/bin/env ruby

require "highline"
require "open3"

# Updates the named default to the new value and returns it if the value is
# truthy; otherwise, returns the previous value of the default.
def read_write_default(name, value)
  filename = File.join(__dir__, "." + name)
  if value
    File.write(filename, value)
    value
  elsif File.exists?(filename)
    File.read(filename)
  else
    nil
  end
end

destination = read_write_default("deploydest",
                                 (File.expand_path(ARGV[0]) if ARGV[0]))&.strip
unless destination
  puts("Please provide destination directory:")
  puts("#{$0} destination")
  exit(1)
end

system("bundle", "exec", "jekyll", "build",
       "--trace",
       "--destination", destination)
puts

id = Open3.capture2("git", "describe", "--always", "--dirty").first.strip

Dir.chdir(destination) do
  system("git", "add", "--all")
  if Open3.capture2("git", "status", "--porcelain").first.empty?
    puts("No changes made.")
  else
    system("git", "status")
    if HighLine.agree("Commit and sync?")
      system("git", "commit", "--message", "Build #{id}")
      system("git", "pull", "--strategy", "ours")
      system("git", "push")
    end
  end
end

if ARGV[0]
  puts
  puts("Note: This script will remember the destination #{destination}.")
  puts("You can run it again without arguments: #{$0}")
end
