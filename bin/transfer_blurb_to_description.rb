#!/usr/bin/env ruby

# This is a temporary file which exists to support the problem-specifications issue #767
# [Make description.md self contained.](# https://github.com/exercism/problem-specifications/issues/767)
#
# The exercise description given in description.md should be complete and self
# contained, and not require the addition of the blurb to make sense.
#
# This script copies the current blurb into description.md for all exercises.
#
# It will NOT update the description if it already begins with the blurb.
# Thus this script will not add multiple blurbs if it is run multiple times.

require 'yaml'

class Exercise
  attr_reader :path
  def initialize(path)
    @path = path
  end

  def update_description
    unless description.start_with?(blurb)
      complete_description = format("%s\n\n%s", blurb, description)
      File.write(description_filename, complete_description)
    end
  end

  private

  def blurb
    metadata['blurb']
  end

  def metadata
    # TODO: Update to parse TOML instead
    metadata_filename = File.join(path, 'metadata.yml')
    YAML.load_file(metadata_filename)
  end

  def description
    File.read(description_filename)
  end

  def description_filename
    File.join(path, 'description.md')
  end
end


exercises = Dir.glob('exercises/*').map {|path| Exercise.new(path)}

updated = exercises.count do |exercise|
  exercise.update_description
end

puts "#{updated}/#{exercises.count} exercises updated"
