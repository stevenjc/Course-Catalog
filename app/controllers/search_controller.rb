class SearchController < ApplicationController
    def index

    end

    def show_results
        @courses=Course.where("name LIKE ?", "%#{params[:name]}%")
        # @subjects = Subject.where("name LIKE ?", "%#{params[:subject]}%")
        # if false
        #     temp_course_list = Array.new
        #     @subjects.each do |subject|
        #         subject_id = subject.subject_id
        #
        #         @courses.each do |course|
        #             course_subjects = ActiveSupport::JSON.decode(course.subjects)
        #             valid = false
        #             course_subjects.each do  |course_subject|
        #                 if course_subject[id] == subject_id
        #                     valid = true
        #                 end
        #             end
        #             if valid
        #                 temp_course_list.push(course)
        #             end
        #         end
        #     end
        #     @courses = temp_course_list
        # end
        render partial: "results"
    end

    def enroll
        enrollment = CoursesUser.new
        course = params[:course]
        enrollment.course_id = course
        enrollment.user_id = current_user.id
        enrollment.save
        redirect_to "/"
    end

end
