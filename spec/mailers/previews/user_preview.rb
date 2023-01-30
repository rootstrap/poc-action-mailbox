# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def missing_user
    UserMailer.missing_user(Faker::Internet.email)
  end
end
