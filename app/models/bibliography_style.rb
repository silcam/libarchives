class BibliographyStyle < ApplicationRecord
  belongs_to :document_type
  belongs_to :field
end
