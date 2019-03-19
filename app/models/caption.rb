class Caption < ApplicationRecord
    validates :caption,
    presence: true,
    length: {maximum: 128},
    on: [:create, :update],
    allow_nil: false
end
