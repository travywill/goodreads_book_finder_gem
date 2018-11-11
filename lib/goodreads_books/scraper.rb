class Scraper # This class scrapes information from www.goodreads.com

  def self.scrape_search_results(query)
    # This method collects an array of Book objects based on information gathered from search results from www.goodreads.com

    books = [] # An array for collecting Book objects

    query.each_char do |letter| # Formats the search terms to be put in the search results url
      if letter == " "
        letter = "+"
      end
    end

    # Opens the search results webpage using open-uri and collects the information using Nokogiri
    html = open("https://www.goodreads.com/search?q=#{query}")
    doc = Nokogiri::HTML(html)

    table = doc.at(".tableList") # The table with the relevant search results information

    table.search('tr').each do |tr| # Searches each row in the table.  (Each row has info about 1 book)
      book_hash = {} # A hash for gathering book information
      book_authors = [] # An array for gathering the names of multiple authors
      book_title = tr.search(".bookTitle span").text # Gets the book's title
      book_url = tr.css("a.bookTitle @href").text # Gets the url of the book's webpage on www.goodreads.com
      tr.search(".authorName span").each do |author| # Gathers each author's name into an array
        book_author = author.text
        book_authors << book_author
      end

      # Adds the book information into the hash
      book_hash[:title] = book_title
      book_hash[:authors] = book_authors
      book_hash[:profile_url] = book_url

      book = Book.all.find { |b| b.profile_url == book_url} # Iterates through items saved in Book class to see if book already exists in it
      book = Book.new(book_hash) if book == nil # Creates a new Book object if book doesn't already exist in Book class
      books << book # Collects the Book object in the array
    end

    books # Returns the array of Book objects
  end

  def self.scrape_book_profile_page(book)
    # This method uses the profile_url information from a Book object to gather the book's summary from that book's webpage on
    # www.goodreads.com

    # Opens the book's webpage using open-uri and collects the information using Nokogiri
    html = open("https://www.goodreads.com#{book.profile_url}")
    doc = Nokogiri::HTML(html)

    book.summary = doc.css(".readable.stacked span").text # Gets the book's summary information and adds it to the Book object

    book.summary # Returns the Book object's summary information
  end
end
