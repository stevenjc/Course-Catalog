require "test_helper"

class CoursesUserTest < ActiveSupport::TestCase
  def courses_user
    @courses_user ||= CoursesUser.new
  end

  def test_valid
    assert courses_user.valid?
  end
end
