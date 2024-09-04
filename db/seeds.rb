owner = User.create! email: 'diana@lw.com', password: 123456, nickname: 'dianasportela'
client = User.create! email: 'jasmim@lw.com', password: 123456, nickname: 'jfmattos'

tropikus = Restaurant.create! name: 'Tropikus', user: owner
