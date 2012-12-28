class Post

  include MongoMapper::Document
  include Monglobal

  translates :title, :body

  key :title,       String
  key :body,        String
  key :slug,        String
  key :comments,    String
  key :active,      String

  # Cached values
  key :comment_count,   Integer,  :default => 0
  key :username,        String

  timestamps!


end

