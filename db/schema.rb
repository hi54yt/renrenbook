# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110801161401) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors_books", :id => false, :force => true do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  create_table "books", :force => true do |t|
    t.string   "publisher"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "doubanlink"
    t.string   "imagelink"
    t.string   "author"
    t.string   "ISBN10"
    t.string   "ISBN13"
    t.text     "attr"
  end

  create_table "books_users", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "user_id"
  end

  create_table "guanxi_of_book_author", :force => true do |t|
    t.integer  "book_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guanxi_of_book_author", ["author_id"], :name => "index_guanxi_of_book_author_on_author_id"
  add_index "guanxi_of_book_author", ["book_id", "author_id"], :name => "index_guanxi_of_book_author_on_book_id_and_author_id", :unique => true
  add_index "guanxi_of_book_author", ["book_id"], :name => "index_guanxi_of_book_author_on_book_id"

  create_table "ownerships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.float    "price"
    t.integer  "howold"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ownerships", ["book_id"], :name => "index_ownerships_on_book_id"
  add_index "ownerships", ["user_id"], :name => "index_ownerships_on_user_id"

  create_table "userized_books", :force => true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "userized_books", ["book_id"], :name => "index_userized_books_on_book_id"
  add_index "userized_books", ["user_id"], :name => "index_userized_books_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "university"
    t.string   "major"
    t.date     "year_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "renren_id"
  end

  add_index "users", ["renren_id"], :name => "index_users_on_renren_id"

end
