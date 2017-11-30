require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe 'attributes' do
    it 'responds to entries' do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it 'initializes entries as an array' do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it 'initializes entries as empty' do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe '#add_entry' do
    it 'adds only one entry to the address book' do
      book = AddressBook.new
      book.add_entry('Jared Truscott', '555.555.1234', 'jtruscott78@gmail.com')

      expect(book.entries.size).to eq(1)
    end

    it 'adds the correct information to entries' do
      book = AddressBook.new
      book.add_entry('Jared Truscott', '555.555.1234', 'jtruscott78@gmail.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Jared Truscott')
      expect(new_entry.phone_number).to eq('555.555.1234')
      expect(new_entry.email).to eq('jtruscott78@gmail.com')
    end
  end

  describe '#remove_entry' do
    it 'removes one entry from the address book' do
      book = AddressBook.new
      book.add_entry('Jared Truscott', '555.555.1234', 'jtruscott78@gmail.com')

      # create a new entry
      name = 'Delete Me'
      phone = '222.111.333'
      email = 'dismymail@email.com'

      book.add_entry(name, phone, email)
      expect(book.entries.size).to eq(2)


      book.remove_entry(name, phone, email)
      expect(book.entries.first.name).to eq("Jared Truscott")
    end
  end
end
