class House < ActiveRecord::Base
    has_many :people, {
    primary_key: :id,
    foreign_key: :resident_id
    }
end
