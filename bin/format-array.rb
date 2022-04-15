require 'json'

# format-array expresses (and enacts) our per-file preferences for array formatting,
# in cases where the preference differs from prettier.
#
# It has only one mode of operation:
# Run it without any arguments to format the files.

# format-array was written because we want to keep files consistently formatted,
# while also optimising for human readability.
#
# As part of optimising for human readability,
# some arrays should be formatted such that each element is on its own line,
# whereas some other arrays should be formatted such that the entire array is on one line.
#
# We could not find an existing tool that allows us to specify array formatting how we wanted.

# The configuration of array formatting preferences.
#
# format can be the following choices:
#
# * single_line (the entire array and all of its elements should be on a single line)
# * multi_line (each element of the array is on its own line)
# * multi_line_unless_single (like multi_line, except arrays with one element remain on a single line)
# * multi_line_deep (multi_line, even applied to arrays within that array)
# * padded (14 elements per line padded to 3 characters per element)
#     (TODO: padding amount could be configurable, but we haven't needed it)
formats = {
  'book-store' => {
    'basket' => :single_line,
  },
  'bowling' => {
    'previousRolls' => :single_line,
  },
  'change' => {
    'expected' => :single_line,
  },
  'connect' => {
    'board' => :multi_line,
  },
  'diamond' => {
    'expected' => :multi_line,
  },
  'dominoes' => {
    'dominoes' => :single_line,
  },
  'flatten-array' => {
    'array' => :multi_line_deep,
    'expected' => :multi_line,
  },
  'forth' => {
    'instructions' => :multi_line_unless_single,
  },
  'go-counting' => {
    'board' => :multi_line,
  },
  'killer-sudoku-helper' => {
    'expected' => :single_line,
  },
  'minesweeper' => {
    'minefield' => :multi_line_unless_single,
    'expected' => :multi_line_unless_single,
  },
  'ocr-numbers' => {
    'rows' => :multi_line,
  },
  'pascals-triangle' => {
    'expected' => :multi_line,
  },
  'rectangles' => {
    'strings' => :multi_line_unless_single,
  },
  'saddle-points' => {
    'matrix' => :multi_line,
  },
  'scale-generator' => {
    'expected' => :single_line,
  },
  'sieve' => {
    'expected' => :padded,
  },
  'state-of-tic-tac-toe' => {
    'board' => :multi_line,
  },
  'transpose' => {
    'lines' => :multi_line,
    'expected' => :multi_line,
  },
  'variable-length-quantity' => {
    'integers' => :single_line,
    'expected' => :single_line,
  },
  'word-search' => {
    'grid' => :multi_line,
    'wordsToSearchFor' => :multi_line,
  },
}.each_value(&:freeze).freeze

def single_line_arrays(contents, key)
  # matches things of the form "key": [1, 2, 3]
  # because this is not a multi-line regex,
  # . does NOT match newlines.
  contents.scan(/^( +)"#{key}": (\[.*\],?$)/)
end

def multi_line_arrays(contents, key)
  # matches things of the form
  # "key": [
  #   1,
  #   2,
  #   3
  # ]
  # because this IS a multi-line regex (note the /m),
  # . DOES match newlines.
  #
  # To find which closing bracket matches the opening bracket,
  # we find the *first* closing bracket that is both:
  # - the only thing on its line (except for maybe a comma afterward)
  # - at the same indentation level as the key
  #
  # to find the first of these, make the match non-greedy (*? instead of *)
  contents.scan(/^( +)"#{key}": (\[$.*?^\1\],?$)/m)
end

formats.each { |exercise, exercise_format|
  filename = "#{__dir__}/../exercises/#{exercise}/canonical-data.json"
  contents = File.read(filename)
  exercise_format.each { |key, format_type|
    replace = ->(old, new) {
      # Include the key in both the search and the replacement,
      # to avoid accidentally replacing something we didn't mean to.
      # This has been observed to be important for transpose,
      # where ["A1"] is both an input and an output.
      contents.sub!(%Q("#{key}": #{old}), %Q("#{key}": #{new}))
    }

    case format_type
    when :single_line
      multi_line_arrays(contents, key).each { |indent, arr|
        arr_lines = arr.lines
        raise "impossible, array doesn't start with [ but instead #{arr_lines[0]}" if arr_lines[0] != "[\n"
        raise "impossible, array doesn't end with ] but instead #{arr_lines[-1]}" unless arr_lines[-1].match?(/^ *\],?$/)
        replace[arr, "[#{arr_lines[1...-1].map(&:strip).join(' ')}]#{',' if arr[-1] == ','}"]
      }
    when :multi_line, :multi_line_unless_single
      single_line_arrays(contents, key).each { |indent, arr|
        elements = JSON.parse(arr.delete_suffix(','))
        next if elements.empty?
        next if elements.size == 1 && format_type == :multi_line_unless_single
        indented_elements = elements.map { |el|
          js = JSON.generate(el)
          # JSON.generate will output [1,2,3] but we want [1, 2, 3]
          "#{indent}  #{el.is_a?(Array) ? js.gsub(',', ', ') : js}"
        }
        # all lines but the last need a trailing comma
        replace[arr, "[\n#{indented_elements.join(",\n")}\n#{indent}]#{',' if arr[-1] == ','}"]
      }
    when :multi_line_deep
      single_line_arrays(contents, key).each { |indent, arr|
        # pretty_generate will render an empty array as:
        # [
        #
        # ]
        # whereas we just want []
        pretty_lines = JSON.pretty_generate(JSON.parse(arr)).sub(/\[\s+\]/, '[]').lines
        if pretty_lines == ['[]']
          replace[arr, '[]']
        else
          raise "impossible, array doesn't start with [ but instead #{pretty_lines[0]}" if pretty_lines[0] != "[\n"
          raise "impossible, array doesn't end with ] but instead #{pretty_lines[-1]}" if pretty_lines[-1] != "]"
          replace[arr, "[\n" + pretty_lines[1...-1].map { |l| "#{indent}#{l}" }.join + "#{indent}]#{',' if arr[-1] == ','}"]
        end
      }
    when :padded
      multi_line_arrays(contents, key).each { |indent, arr|
        elements = JSON.parse(arr)
        padded_elements = elements.map { |el| '%3d' % el }
        new_rows = padded_elements.each_slice(14).map { |row| indent + '  ' + row.join(', ') }
        # all lines but the last need a trailing comma
        replace[arr, "[\n#{new_rows.join(",\n")}\n#{indent}]"]
      }
    else
      raise "unknown #{exercise} #{key} #{format_type}"
    end
  }
  File.write(filename, contents)
}
