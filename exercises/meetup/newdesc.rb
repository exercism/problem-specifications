require 'json'

j = JSON.parse(File.read(File.join(__dir__, 'canonical-data.json')))

def ord(n)
  case n
  when 1; '1st'
  when 2; '2nd'
  when 3; '3rd'
  when 21; '21st'
  when 22; '22nd'
  when 23; '23rd'
  when 31; '31st'
  else "#{n}th"
  end
end

def mod_desc_for_range(c, week, first, last)
  raise "bad #{c['input']['week']} != #{week}" if c['input']['week'] != week

  if c['expected'].end_with?('-%02d' % first)
    c['description'] = "when #{week} #{c['input']['dayofweek']} is the #{ord(first)}, the first day of the #{week} week"
  elsif c['expected'].end_with?('-%02d' % last)
    c['description'] = "when #{week} #{c['input']['dayofweek']} is the #{ord(last)}, the last day of the #{week} week"
  else
    c['description'] = "when #{week} #{c['input']['dayofweek']} is some day in the middle of the #{week} week"
  end
end

j['cases'].each { |c|
  case c['input']['week']
  when 'teenth'; mod_desc_for_range(c, 'teenth', 13, 19)
  when 'first'; mod_desc_for_range(c, 'first', 1, 7)
  when 'second'; mod_desc_for_range(c, 'second', 8, 14)
  when 'third'; mod_desc_for_range(c, 'third', 15, 21)
  when 'fourth'; mod_desc_for_range(c, 'fourth', 22, 28)
  when 'last'
    month = Integer(c['expected'].split(?-, 3)[1], 10)
    day = Integer(c['expected'].split(?-, 3)[2], 10)
    dow = c['input']['dayofweek']
    if month == 2 && day == 29
      c['description'] = "when last #{dow} in February in a leap year is the 29th"
    elsif month == 2 && day == 22
      c['description'] = "when last #{dow} in February in a non-leap year is not the 29th"
    elsif month == 12 && day == 31
      c['description'] = "last #{dow} in December that also happens to be the last day of the year"
    else
      c['description'] = "last #{dow} in a month with #{day > 28 ? 'five' : 'four'} #{dow}s"
    end
  else
    $stderr.puts("no new description for #{c['description']}")
  end
}

seen = {}
# dedup by notating some cases with "another"
j['cases'].each { |c|
  desc = c['description']
  if seen[desc]
    new_desc = desc.include?('some day') ? desc.sub('some day', 'another day') : desc.sub('a month with', 'another month with')
    raise "couldn't fix #{desc}" if new_desc == desc
    raise "tried to fix #{desc} but even #{new_desc} was already seen" if seen[new_desc]
    seen[new_desc] = true
    c['description'] = new_desc
  end
  seen[desc] = true
}

puts JSON.pretty_generate(j)
