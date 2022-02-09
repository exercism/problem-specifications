#!/usr/bin/env ruby

CORRECT_ORDER = %w[uuid reimplements description comments scenarios property input expected]

require 'json'

def find_tests(json)
  if json['cases']
    json['cases'].flat_map {|cases| find_tests(cases)}
  elsif json['uuid']
    [json]
  end
end

exit_code = 0

Dir.glob('exercises/*/canonical-data.json').each do |path|
  json = JSON.parse(File.read(path))
  invalid_tests = find_tests(json).select {|test| (CORRECT_ORDER & test.keys) != test.keys}
  next if invalid_tests.empty?

  puts "#{path} has tests with the wrong key order:"
  invalid_tests.each do |test|
    puts "- Test: #{test['uuid']}"
    puts "  Actual: #{test.keys}"
    puts "  Expected: #{(CORRECT_ORDER & test.keys)}"
    puts ""
  end

  exit_code = 1
end

exit(exit_code)
