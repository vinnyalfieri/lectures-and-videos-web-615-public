class Post < ActiveRecord::Base
  belongs_to :author
  has_many :post_tags
  has_many :tags, :through => :post_tags

  def author_name
    self.author.name if self.author
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(:name => name)
  end

  def tags_to_add_by_name=(names_csv)
    tags_names = names_csv.split(",").collect{|t| t.strip}
    tags_names.each do |name|
      self.add_tag_by_name(name)
    end
  end

  def add_tag_by_name(name)
    tag = Tag.find_or_create_by(:name => name)
    self.post_tags.build(:tag => tag)
  end

  def to_slug
    self.title.downcase.gsub(" ", "-")
  end
end
