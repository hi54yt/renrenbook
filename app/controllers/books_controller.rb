class BooksController < ApplicationController
  require 'net/http' 

  def parse_doubanid(link)
    link[link[0..-2].rindex("/")+1..-2].to_i
  end

  def douban_book_search(q)
    db_url = "http://api.douban.com/book/subjects?q=#{q}&start-index=1&max-results=5&alt=json"
    url = URI.parse(URI.encode(db_url))
    res = Net::HTTP.get url
    #debugger
    db_book_hash = ActiveSupport::JSON.decode res #{db_book_json_str}
    @booklist = []
    db_book_hash['entry'].each do |item|
      book = create_from_douban item
      @booklist.push book
    end
    @booklist    
  end


  def create_from_douban(item)
    book = Book.new(:title => item['title']['$t'])
    # TODO: combine author together or make it a list
    book.author = item['author'][0]['name']['$t'] if !item['author'].nil? && !item['author'][0]['name'].nil?
    item['link'].each do |l|
      book.doubanlink = l['@href'] if l['@rel'] == 'alternate'
      book.imagelink = l['@href'] if l['@rel'] == 'image'
    end
    book.doubanid = parse_doubanid book.doubanlink
    book.attr = item['db:attribute']
    item['db:attribute'].each do |att|
      book.publisher = att['$t'] if att['@name'] == 'publisher'
      book.ISBN10 = att['$t'] if att['@name'] == 'isbn10'
      book.ISBN13 = att['$t'] if att['@name'] == 'isbn13'
    end
#    logger.debug "ISBN: #{book.ISBN13}"
    book
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
    doubanid = params[:doubanid]
    @book = Book.find_by_doubanid doubanid
    if @book.nil? then
      db_url = "http://api.douban.com/book/subject/#{doubanid}?alt=json"
      url = URI.parse(URI.encode(db_url))
      res = Net::HTTP.get url
      #debugger
      item = ActiveSupport::JSON.decode res #{db_book_json_str}
      @book = create_from_douban item
      @book.serialize
      logger.debug @book.attr
      @book.save
    end
    @book.deserialize
  end

  def update
  end

  def destroy
  end

  def test
  end
end
