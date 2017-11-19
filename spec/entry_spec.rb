require_relative '../models/entry'

RSpec.describe Entry do
  describe 'attributes' do
    let(:entry) { Entry.new('Jared Truscott', '555.555.1234', 'jtruscott78@gmail.com') }
    it 'responds to name' do
      expect(entry).to respond_to(:name)
    end

    it 'reports its name' do
      expect(entry.name).to eq('Jared Truscott')
    end

    it 'responds to phone number' do
      expect(entry).to respond_to(:phone_number)
    end

    it 'reports its phone_number' do
      expect(entry.phone_number).to eq('555.555.1234')
    end

    it 'resonds to email' do
      expect(entry).to respond_to(:email)
    end

    it 'reports its email' do
      expect(entry.email).to eq('jtruscott78@gmail.com')
    end
  end

  describe "#to_s" do
   it "prints an entry as a string" do
     entry = Entry.new('Jared Truscott', '555.555.1234', 'Jtruscott78@gmail.com')
     expected_string = "Name: Jared Truscott\nPhone Number: 555.555.1234\nEmail: Jtruscott78@gmail.com"

     expect(entry.to_s).to eq(expected_string)
   end
  end
end
