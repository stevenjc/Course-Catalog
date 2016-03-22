require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  def subject
    @subject ||= Subject.new
  end

  def test_valid
    assert subject.valid?
  end
end
