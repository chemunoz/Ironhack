cities = ["sf", "nyc", "austin", "washington dc"]

longest = ""
cities.each do |city|
    if longest.length < city.length
        longest = city
    end
end
longest


cities.reduce do |longest, city|
    if longest.length < city.length
        city
    else
        longest
    end
end

cities.reduce { |long, city| long.length < city.length ? city : long }