class DocumentType < ApplicationRecord
  has_many :archives
  has_many :bibliography_styles
end
