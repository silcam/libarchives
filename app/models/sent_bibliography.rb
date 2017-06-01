class SentBibliography < ApplicationRecord
  belongs_to :archive
  belongs_to :destination
end
