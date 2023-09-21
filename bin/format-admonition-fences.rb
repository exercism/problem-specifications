#!/usr/bin/env ruby

BACKTICK_MATCH_REGEX = /(?<fence>[`~]{3,})(?<type>exercism\/[a-z]+)(?<admonition>.*?)(?<end>\k<fence>)/m.freeze
TILDE_REPLACE = '~~~~\k<type>\k<admonition>~~~~'.freeze

Dir.glob('exercises/**/*.md') do |filepath|
  contents = File.read(filepath)
  contents.gsub!(BACKTICK_MATCH_REGEX, TILDE_REPLACE)
  File.write(filepath, contents)
end
