require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../goodreads_books/cli.rb'
require_relative '../goodreads_books/book.rb'
require_relative '../goodreads_books/scraper.rb'

class CLI # This class runs the command-line interface for the gem

  def call
    # This method welcomes the user and runs the program
    puts ""
    puts "Welcome to the GoodReads Book Finder!"
    puts ""
    menu # Runs the menu method
    puts ""
  end

  def menu
    # This method allows the user to search for books based on key words and read a summary of any book in the search results
    puts "Please enter your key words to search for a book: "
    query = gets.strip
    puts ""
    list_books(query) # Runs the list_books method with the user's key words to print a list of books to the screen
    puts ""
    puts "Would you like to read a summary of one of these books? (y/n)"
    input = gets.strip
    until input == "y" || input == "n" # Makes sure the user enters valid input
      puts "Please answer with y or n: "
      input = gets.strip
    end
    if input == "y" # Runs the show_summary method if the user indicated wanting to read a summary
      puts ""
      show_summary
    elsif input == "n" # Asks if the user would like to conduct another search if no summary is wanted
      puts ""
      puts "Would you like to conduct a new search? (y/n)"
      input = gets.strip
      until input == "y" || input == "n" # Makes sure the user enters valid input
        puts "Please answer with y or n: "
        input = gets.strip
      end
      if input == "y" # Begins a new search by re-running the menu method
        puts ""
        menu
      elsif input == "n" # Exits the program using the goodbye method if the user does not want to conduct another search
        puts ""
        goodbye
      end
    end
  end

  def list_books(search_terms)
    # This method prints a numbered list of books to the screen based on the user's search terms
    query = search_terms # The user's search terms
    @scraper = Scraper.new # Creates a new Scraper object
    @book_list = @scraper.scrape_search_results(query) # Creates an array of Book objects based on user's search terms
    @book_list.each_with_index do |book, index| # Prints a numbered list of the Books to the screen
      if book.authors.length == 1 # Formatting for book with one author
        puts "#{index + 1}. #{book.title} by #{book.authors[0]}"
      elsif book.authors.length == 2 # Formatting for book with two authors
        puts "#{index + 1}. #{book.title} by #{book.authors[0]} and #{book.authors[1]}"
      else # Formatting for book with three or more authors
        authors = ""
        i = 0
        while i < book.authors.length - 2
          authors += "#{book.authors[i]}, "
          i += 1
        end
        authors += "#{book.authors[book.authors.length - 2]} and #{book.authors[book.authors.length - 1]}"
        puts "#{index + 1}. #{book.title} by #{authors}"
      end
    end
  end

  def show_summary
    # This method prints a summary of a book to the screen based on the user's input
    puts "Enter the number of the book for which you would like a summary: "
    input = gets.strip
    input = input.to_i
    until input > 0 && input <= @book_list.length # Makes sure the user enters valid input
      puts "Please answer with a valid number: "
      input = gets.strip
      input = input.to_i
    end
    summary = @scraper.scrape_book_profile_page(@book_list[input -1]) # Gets the book's summary information
    puts ""
    puts summary
    puts ""
    puts "Would you like to read a summary of another one of the books from your search results? (y/n)"
    input = gets.strip
    until input == "y" || input == "n" # Makes sure the user enters valid input
      puts "Please answer with y or n: "
      input = gets.strip
    end
    if input == "y" # Reprints list of books if user wants to read another summary from that list
      puts ""
      @book_list.each_with_index do |book, index|
        if book.authors.length == 1 # Formatting for book with one author
          puts "#{index + 1}. #{book.title} by #{book.authors[0]}"
        elsif book.authors.length == 2 # Formatting for book with two authors
          puts "#{index + 1}. #{book.title} by #{book.authors[0]} and #{book.authors[1]}"
        else # Formatting for book with three or more authors
          authors = ""
          i = 0
          while i < book.authors.length - 2
            authors += "#{book.authors[i]}, "
            i += 1
          end
          authors += "#{book.authors[book.authors.length - 2]} and #{book.authors[book.authors.length - 1]}"
          puts "#{index + 1}. #{book.title} by #{authors}"
        end
      end
      puts ""
      show_summary # Reruns the show_summary method if the user wants to read another summary from the current list of books
    elsif input == "n" # Allows user to conduct another search for books if no summary is wanted from the current list
      puts ""
      puts "Would you like to conduct a new search? (y/n)"
      input = gets.strip
      until input == "y" || input == "n" # Makes sure the user enters valid input
        puts "Please answer with y or n: "
        input = gets.strip
      end
      if input == "y" # Reruns the menu method if the user wants to conduct another search
        puts ""
        menu
      elsif input == "n" # Exits the program via the goodbye method if user does not want to conduct another search
        puts ""
        goodbye
      end
    end
  end

  def goodbye
    # This method thanks the user upon exiting the program
    puts "Thanks for using the GoodReads Book Finder!"
  end

end
