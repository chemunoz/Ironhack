#MI SCRIPT HACE MUCHAS COSAS

class Counter
    def self.word_count(text)
        text.split.size
    end
end

class User
    def initialize (username, password)
        @username = username
        @password = password
    end
    def authenticate
        @password == "12345" ? true : false
    end
end


puts "enter your username:"
username = gets.chomp
puts "enter your password:"
password = gets.chomp
user = User.new(username, password)
if user.authenticate
    puts "enter a text:"
    text = gets
    size = Counter.word_count(text)
    puts "Your text has #{size} word#{size == 1? '' : 's'}"
else
    puts "wrong password"
end
