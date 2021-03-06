# Courses, admin, plan, and scores
course = FactoryGirl.create(:course)
past_course = FactoryGirl.create(:past_course)
part_time_course = FactoryGirl.create(:part_time_course)
FactoryGirl.create(:admin, current_course: course)
FactoryGirl.create(:upfront_payment_only_plan)
FactoryGirl.create(:passing_score)
FactoryGirl.create(:in_between_score)
FactoryGirl.create(:failing_score)

# Students
15.times do
  FactoryGirl.create(:user_with_all_documents_signed, course: course)
  FactoryGirl.create(:user_with_all_documents_signed, course: past_course)
  FactoryGirl.create(:user_with_all_documents_signed, course: part_time_course)
end

# Code reviews
5.times do
  FactoryGirl.create(:code_review, course: course)
  FactoryGirl.create(:code_review, course: past_course)
  FactoryGirl.create(:code_review, course: part_time_course)
end

# Code review submissions
Student.all.each do |student|
  student.update(sign_in_count: 1)
  code_reviews = CodeReview.where(course_id: student.courses.pluck(:id))
  code_reviews.each do |code_review|
    FactoryGirl.create(:submission, code_review: code_review, student: student)
  end
end

# Tracks
Track.create(description: 'Ruby/Rails')
Track.create(description: 'PHP/Drupal')
Track.create(description: 'Java/Android')
Track.create(description: 'C#/.NET')
Track.create(description: 'CSS/Design')
