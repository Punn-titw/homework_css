# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
    def initialize(name, email, password)
        # Instance variables, denoted by @, store data unique to each instance of the class
        @name = name
        @email = email
        @password = password
    end

    def enter_room(room)
      room.users << self
      puts "#{@name} joined #{room.name}"
    end
    
    def send_message(room, content)
        message = Message.new(self, room, content)
        room.broadcast(message)
    end
end

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users

class Room
    attr_accessor :name, :description, :users

    def initialize(name, description)
        @name = name
        @description = description
        @users = []
    end

    def broadcast(message)
      puts "Message from #{message.user.name} to room #{name}: #{message.content}"
      i = 0
    while i < @users.length
      user = @users[i]
      if user != message.user  # ไม่ส่งข้อความกลับไปหาผู้ส่งเอง
        puts "Notification: #{user.name} received the message"
      end
      i += 1
    end
  end
end

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content

class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
user1 = User.new("Punn", "punn@bumil.net", "password123")
user2 = User.new("Post", "post@bumil.net", "password456")

room1 = Room.new("Meeting Room", "For important meetings")
# add a method to user so, user can enter to a room
user1.enter_room(room1)
user2.enter_room(room1)

# add a method to user so, user can send a message to a room
user1.send_message(room1, "Hello everyone in the room!")
user2.send_message(room1, "Hi Punn!")
# add a method to a room, so it can broadcast a message to all users
room1.broadcast(Message.new(user1, room1, "Hi! Post"))




