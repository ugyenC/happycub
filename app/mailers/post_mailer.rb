class PostMailer < ApplicationMailer
    default :from => "cugyen20@gmail.com"
    def post_email(users)
        @users=User.all
        emails=@users.collect(&:email).join(",")
        mail(to: emails, subject: 'New Post Created')
    end
end
