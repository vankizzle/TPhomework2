class Note < ApplicationRecord
  alias_attribute :message, :content
end
