require "test_helper"

class InstructorsControllerTest < ActionController::TestCase
  def instructor
    @instructor ||= instructors :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:instructors)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Instructor.count") do
      post :create, instructor: {  }
    end

    assert_redirected_to instructor_path(assigns(:instructor))
  end

  def test_show
    get :show, id: instructor
    assert_response :success
  end

  def test_edit
    get :edit, id: instructor
    assert_response :success
  end

  def test_update
    put :update, id: instructor, instructor: {  }
    assert_redirected_to instructor_path(assigns(:instructor))
  end

  def test_destroy
    assert_difference("Instructor.count", -1) do
      delete :destroy, id: instructor
    end

    assert_redirected_to instructors_path
  end
end
