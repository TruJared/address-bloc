def greeting
  salutation = ARGV.shift
  ARGV.each { |n| p "#{salutation} " "#{n}" }
end

greeting
