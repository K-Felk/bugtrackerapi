class User < ApplicationRecord

    validates :lname,  presence: true
    validates :fname, presence: true
    validates :email, presence: true
    validates :thumbnail, :allow_nil => true

    validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/

    validates_format_of :thumbnail, :with => /[^\s](.gif|.jpg|.png)\z/

    validates_uniqueness_of :email

    
    has_many :bugs
end
