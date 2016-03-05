cities=["columbia", "miami", "washintong", "roma"]

#puts cities.reduce{|acu, item| acu=item.length}

# cities.reduce(0) do |acu, item|
#   if item.length>acu
#     acu=item.length
#   end
#   acu
# end


puts cities.reduce {|long, city| long.length<city.length ? city : long}