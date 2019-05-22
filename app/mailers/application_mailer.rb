class ApplicationMailer < ActionMailer::Base
  default from: %{"Test Guru" <mail@test-guru.com>}
  layout 'mailer'
end
