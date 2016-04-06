class SearchController < ApplicationController
require 'json'
    def index
      @subjects = Subject.all
    end

    def show_results
        @courses=Course.where("name LIKE ?", "%#{params[:name]}%")

        subject_id = params[:subject_id].to_s.split "=>"
        subject_id = subject_id[1].split "}"
        subject_id = subject_id[0].to_s
        @search_results= Array.new
        #Iterate through courses to narrow results to courses with correct subject id
        @courses.each do |course|
          subjects = course.subjects
          #separate each subject this course is included in
          subjects = subjects.split "}"

          subjects.each do |subject|
            #pull out subject id from subject data
            data = subject.split ","
            data.each do |section|

              if section.to_s.include? "id"
                #pull out id number
                id_number = section.split "=>"
                id_number = id_number[1].to_s

                if subject_id == id_number
                  #prevent duplicate courses
                  if not @search_results.include? course
                      @search_results.push course
                  end
                end
              end
            end
          end
        end

        if not @search_results.empty?
          @courses = @search_results
        end

        respond_to do |format|
          format.js
        end
        
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
