# Rails.application.config.middleware.use OmniAuth::Builder do
#       provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
#       {
#        scope: 'userinfo.email, userinfo.profile',
#        prompt: 'select_account',
#        image_aspect_ratio: 'square',
#        image_size: 50,
#        access_type: 'offline'
#      }

#      provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
#            scope: 'email',
#            info_fields: 'email,name'
           
# OmniAuth.config.allowed_request_methods = [:post]
# end
