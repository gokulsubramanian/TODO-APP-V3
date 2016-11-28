class SendMail < ActionMailer::Base
  default :from => 'spgokul@gmail.com'

  def test_mail(user,todo)
  	@user = user
  	@todo = todo
    mail(to: @user.email, subject: 'Remainder for task: '+ @todo.desc, body: "Its a reminder for the task: #{@todo.desc}, @deadline #{@todo.deadline}")
    @todo.update_attributes(:notified => "yes")
  end
end