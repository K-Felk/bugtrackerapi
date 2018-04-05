class Bug < ApplicationRecord

    enum issue_type: { issue:0, enhancement:1, feature:2 }
    enum priority: { low:0, medium:1, high:2 }
    enum status: { open:0, closed:1, monitor:2 }

    validates :title,  presence: true
    validates :description, presence: true
    belongs_to :user

    attribute :issue_type, default: :issue
    attribute :priority, default: :medium
    attribute :status, default: :open
end
