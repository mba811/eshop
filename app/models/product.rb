class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def onsale!
    self.onsale = true
    self.save
  end

  def notsale!
    self.onsale = false
    self.save
  end

end
