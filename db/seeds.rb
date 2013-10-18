# создание юзера



User.create email: 'admin@example.com', password: 'password'
if User.valid?
	puts "Registered"
else
	puts "Something was wrong"
end