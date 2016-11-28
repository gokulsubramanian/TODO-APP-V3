namespace :my_tasks do
  desc "TODO"
  task :reminder => :environment do
        @task_list = Todo.where("status = ?","open")

        @task_list.each do |x|
          is_notify = x.notify
          is_notified = x.notified
          if is_notify == "yes" and is_notified == "no"
            print x.desc
            if x.deadline.to_date == Date.today
              @rr = x.reminder
              @dd = x.deadline
              @tt = Time.now
              @newtime =  @tt + (@rr).minutes
              if @tt.to_s <= @dd.to_s and @newtime.to_s >= @dd.to_s
                print x.desc
                print "Send E-Mail Notification to " 
                puts User.find(x.user_id).email
                SendMail.test_mail(User.find(x.user_id),x).deliver
              end
            end
          end
        end
  end
end
