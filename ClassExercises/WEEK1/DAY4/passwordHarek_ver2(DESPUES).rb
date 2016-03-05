#AHORA HACE MENOS COSAS PORQUE HE EXTRAIDO COMPORTAMIENTO A OTRA CLASE

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

class Authenticator
    def self.authenticateUser
        puts "enter your username:"
        username = gets.chomp
        puts "enter your password:"
        password = gets.chomp
        user = User.new(username, password)
        user.authenticate ? user : nil
    end
end



if Authenticator.authenticateUser
    puts "enter a text:"
    text = gets
    size = Counter.word_count(text)
    puts "Your text has #{size} word#{size == 1? '' : 's'}"
else
    puts "access denied"
end