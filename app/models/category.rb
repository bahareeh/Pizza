class Category < ActiveRecord::Base

  acts_as_tree
  has_many :items, :dependent => :destroy

  validates_presence_of :title, :slug
  validates_numericality_of :position

  def formatted_name
    if self.parent_id.blank?
      category_name = self.slug
    else
      category_name = self.parent.slug + ': ' + self.slug
    end
    category_name.titlecase.gsub(/<\/?[^>]*>/,  "")
  end

  def submenu_title
    title.gsub(/Pizzas/, '').gsub(/<span>(.*)<\/span>/, '')
  end

end
