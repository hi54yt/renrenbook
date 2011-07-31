class BooksController < ApplicationController
  require 'net/http' 
  
  def douban_book_search(q)
    db_url = "http://api.douban.com/book/subjects?q=#{q}&start-index=1&max-results=5&alt=json"
    url = URI.parse(URI.encode(db_url))
    res = Net::HTTP.get url
    #debugger
    db_book_hash = ActiveSupport::JSON.decode res #{db_book_json_str}
    @booklist = []
    db_book_hash['entry'].each do |item|
      book = Book.new(:title => item['title']['$t'])
      # TODO: combine author together or make it a list
      book.author = item['author'][0]['name']['$t'] if !item['author'].nil? && !item['author'][0]['name'].nil?
      item['link'].each do |l|
        book.doubanlink = l['@href'] if l['@rel'] == 'alternate'
        book.imagelink = l['@href'] if l['@rel'] == 'image'
      end
      book.attr = item['db:attribute']
      item['db:attribute'].each do |att|
        book.publisher = att['$t'] if att['@name'] == 'publisher'
        book.ISBN10 = att['$t'] if att['@name'] == 'ISBN10'
        book.ISBN13 = att['$t'] if att['@name'] == 'ISBN13'
      end
      @booklist.push book
    end
    @booklist    
  end

  def new
  end

  def index
  end

  def search
    # search douban 
    # TODO: cache what we have, there are too method. 1. cache query & douban response. 2. search what we have first, namely permanent & partial cache
    douban_book_search params[:q]
    
  end

  def delete
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
