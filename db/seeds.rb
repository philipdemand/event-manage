user1 = User.create(name: 'John Doe')
user2 = User.create(name: 'Jane Smith')

event1 = Event.create(title: 'Event 1')
event2 = Event.create(title: 'Event 2')

Attendance.create(user: user1, event: event1, confirmed: true)
Attendance.create(user: user2, event: event1, confirmed: false)
Attendance.create(user: user1, event: event2, confirmed: true)