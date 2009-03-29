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

require 'test_helper'

class RepositoryAccessesTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
