class Banner < ApplicationRecord
  mount_uploader :cover, CoverUploader
end
