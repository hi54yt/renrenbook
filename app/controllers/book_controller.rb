class BookController < ApplicationController
  
  require 'net/http'

  def add_book_page
    #View of uploading page
     
  end

  def ajax_books_hint
    #give back the hint for possible books
    q = params["q"]

    #debugger
    @db_json_result = douban_book_search(q)
    #render :text=>"the uploaded string is #{douban_book_search(@q)}"
    @html_list = parse_to_html_list(@db_json_result)
    render :partial => "books_possible_list",:content_type => "text/html"
  end

  def douban_book_search(q)
    db_url = "http://api.douban.com/book/subjects?q=#{q}&start-index=1&max-results=5&alt=json"
    url = URI.parse(URI.encode(db_url))
    res = Net::HTTP.get url
    #debugger
    res
  end

  def local_book_search(q)
    #TODO
  end

  def parse_to_html_list(db_book_json_str)
     list_html=''
     db_book_hash = ActiveSupport::JSON.decode "#{db_book_json_str}"
     db_book_hash['entry'].each{|item|
       list_html<< "<li>#{item['title']['$t']} #{item['author'].to_s}</li>"
     }
     list_html
  end
end
