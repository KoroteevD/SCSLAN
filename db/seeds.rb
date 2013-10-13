# создание юзера



User.create email: 'admin@example.com', password: 'password'
if User.is_valid?
	puts "Registered"