require "test_helper"

class CourseTest < ActiveSupport::TestCase
  def course
    @course ||= Course.new
  end

  def test_valid
    assert course.valid?
  end
end
