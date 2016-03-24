class LandingController < ApplicationController
  def show
    if not signed_in?
        redirect_to "/sign_in"
    else
        @enrolled_classes_objects = CoursesUser.where(user_id: current_user.id)
        @list_of_enrolled_courses = Array.new

        @enrolled_classes_objects.each do |object|
            @list_of_enrolled_courses.push(Course.find_by(id: object.course_id))
        end
    end
  end
end
