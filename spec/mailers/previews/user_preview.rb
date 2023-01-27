# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def missing
    UserMailer.missing(Faker::Internet.email)
  end
end
