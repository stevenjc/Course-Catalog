require 'json'


task :import_instructors  => :environment do
  File.open('instructor.json', 'r') do |file|
    file.each do |line|
      instructor_attrs = ActiveSupport::JSON.decode(line)
      instructor = Instructor.create! instructor_attrs

    end
  end
end

task :import_subjects  => :environment do

    JSON.parse(open("subject.json").read).each do |line|
        subject = Subject.new(line)
        subject.id = nil    #nullify id slot set by json
        subject.subject_id = line['id']
        subject.save!
    end
end

task :import_courses => :environment do
    JSON.parse(open("course.json").read).each do |line|
        course = Course.new(line)
        course.id = nil    #nullify id slot set by json
        course.course_id = line['id']
        course.save!
    end
end
