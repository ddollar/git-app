# == Schema Info
#
# Table name: repository_accesses
#
#  id            :integer         not null, primary key
#  repository_id :integer         not null
#  user_id       :integer         not null
#  writable      :boolean         not null
#  created_at    :datetime
#  updated_at    :datetime

class RepositoryAccesses < ActiveRecord::Base
end
