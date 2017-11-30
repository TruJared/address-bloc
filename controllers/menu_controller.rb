require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "\n"
    puts "Main Menu || #{address_book.entries.count} entries"
    puts "1) View all entries"
    puts "2) Create an entry"
    puts "3) Search for an entry"
    puts "4) Import entries from a CSV"
    puts "5) View entry by position number"
    puts "6) Exit"
    print "You must choose, but choose wisely: "

    selection = gets.to_i
    case selection
    when 1
      system 'clear'
      view_all_entries
      main_menu
    when 2
      system 'clear'
      create_entry
      main_menu
    when 3
      system 'clear'
      search_entries
      main_menu
    when 4
      system 'clear'
      read_csv
      main_menu
    when 5
      system 'clear'
      view_by_position
    when 6
      puts "Good-bye!"
      exit(0)
    else
      system 'clear'
      puts 'Invalid Option'
      main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"

      puts "#: #{address_book.entries.index(entry) + 1}"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def create_entry
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def view_by_position
    system "clear"
    print "You currently have #{address_book.entries.count} entries\n"
    print "Position number to retrieve: "
    position_number = (gets.chomp.to_i) - 1

    puts "\n"
    puts address_book.entries[position_number] if position_number >= 0 && position_number < address_book.entries.length
    main_menu
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end
end
