class Book # This class creates an object that stores information about a book

  attr_accessor :title, :authors, :profile_url, :summary

  @@all = [] # An array for storing all objects created in the Book class

  def initialize(book_hash) # Creates a new Book object based on information from a hash
    @title = book_hash[:title]
    @authors = book_hash[:authors]
    @profile_url = book_hash[:profile_url]
    @@all << self # Adds to the Book object to the @@all array
  end

  def self.all # A class method that returns the array that stores all objects created in the Book class
    @@all
  end
end
