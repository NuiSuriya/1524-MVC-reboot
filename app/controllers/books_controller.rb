require_relative '../views/books_view'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def list
    # Fetch ALL the books from Active Record
    # Display all books in View
    display_books
  end

  def add
    # Ask for title => View
    # Ask for price
    # Ask for author
    # Ask for category
    title = @view.ask_for("title")
    price = @view.ask_for("price").to_i
    author = @view.ask_for("author")
    category = @view.ask_for("category")

    # Active Record
    # Create a new book
    # Save a new book
    book = Book.new(title: title, price: price, author: author, category: category)
    book.save
  end

  def edit
    # Fetch ALL the books from Active Record
    # Display all books
    display_books

    # Ask for which book by ID
    # Find the book
    book = set_book

    # Ask for title => View
    # Ask for price
    # Ask for author
    # Ask for category
    new_title = @view.ask_for("title")
    new_price = @view.ask_for("price").to_i
    new_author = @view.ask_for("author")
    new_category = @view.ask_for("category")

    # Edit the data
    book.title = new_title
    book.price = new_price
    book.author = new_author
    book.category = new_category

    # Save the new witrh new data
    book.save
  end

  def delete
    # Fetch ALL the books from Active Record
    # Display all books
    display_books

    # Ask for which book by ID
    # Find the book
    book = set_book

    # Detroy the book
    book.destroy
  end

  def mark_as_rent
    # Fetch ALL the books from Active Record
    # Display all books
    display_books

    # Ask for which book by ID
    # Find the book
    book = set_book

    # Mark as rent

    # if book.rent # => true
    #   book.rent = false
    # else
    #   book.rent = true
    # end

    book.rent = !book.rent

    # Save
    book.save
  end

  private

  def display_books
    books = Book.all
    @view.display(books)
  end

  def set_book
    # Ask for which book by ID
    # Find the book
    id = @view.ask_for('ID').to_i
    Book.find(id)
  end
end
