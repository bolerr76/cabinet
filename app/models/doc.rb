class Doc < ActiveRecord::Base
    belongs_to :user #All documents belong to user
end
