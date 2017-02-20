class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :category
  belongs_to :brand

  def onsale!
    self.onsale = true
    self.save
  end

  def notsale!
    self.onsale = false
    self.save
  end

end
