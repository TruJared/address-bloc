require_relative 'controllers/menu_controller'

menu = MenuController.new

system "clear"
puts "Welcome to AddressBloc \n "

puts"currently using sample entries"

menu.address_book.add_entry('jared', '555', 'email daft')
menu.address_book.add_entry('dale', 'pale', 'ale')

menu.main_menu
