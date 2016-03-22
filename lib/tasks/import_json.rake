require 'json'


task :import_instructor  => :environment do
  File.open('instructor.json', 'r') do |file|
    file.each do |line|
      instructor_attrs = ActiveSupport::JSON.decode(line)
      instructor = Instructor.create! instructor_attrs

    end
  end
end

task :import_subject  => :environment do
    file = File.read('subject.json')
    subject_attrs = JSON.parse(file)
    puts subject_attrs
    subject = Subject.new
    subject.subject_id = subject_attrs.delete("id")
    subject.comment = subject_attrs.delete("comment")
    subject.term = subject_attrs.delete("term")
    subject.name = subject_attrs.delete("name")
    subject.abbreviation = subject_attrs.delete("abbreviation")
    subject.save
end

task :import_course => :environment do
  File.open('course.json', 'r') do |file|
    file.each do |line|
      course_attrs = JSON.parse line

      course = Course.create! course_attrs

    end
  end
end
