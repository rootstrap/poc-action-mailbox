# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def missing
    UserMailer.missing('claudio.kerekes@rootstrap.com')
  end
end
