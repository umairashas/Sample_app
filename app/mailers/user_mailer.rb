# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    attachments['download.png'] = File.read(Rails.root.join('public', 'download.png'))  
    attachments.inline['image.jpg'] = File.read(Rails.root.join('public', 'image.jpg'))
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def first_todo(user)
    @user = user
    attachments['download.png'] = File.read(Rails.root.join('public', 'download.png'))  
    attachments.inline['image.jpg'] = File.read(Rails.root.join('public', 'image.jpg'))
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
