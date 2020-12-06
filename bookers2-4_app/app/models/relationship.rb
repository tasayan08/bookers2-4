class Relationship < ApplicationRecord

 belongs_to :follower, class_name: "User"
 belongs_to :followed, class_name: "User"

 # varidates :user_id, presence: true
 # varidates :follow_id, presence: true
end
