# == Schema Info
#
# Table name: repositories
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  public     :boolean         not null
#  created_at :datetime
#  updated_at :datetime

require 'test_helper'

class RepositoriesTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
