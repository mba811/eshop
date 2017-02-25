class Category < ApplicationRecord
  validates :name, :presence => true

  scope :main_categories, -> { where(:is_main_category => true) }
  scope :sub_categories, -> { where(:is_main_category => false) }

  has_many :products

  belongs_to :parent_category, :class_name => :Category, :foreign_key => "parent_category_id"
  has_many :children_categories,
          -> { where :is_main_category => false},
          :class_name => :Category,
          :foreign_key => :parent_category_id,
          :primary_key => :id

  def parent_category_name
    self.try(:parent_category).try(:name)
  end



end
