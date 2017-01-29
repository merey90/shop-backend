This is backend for Shop project based on RubyOnRails 5 API mode;

I'm using gem 'devise_token_auth' for backend
//instructions at https://github.com/lynndylanhurley/devise_token_auth

I'm using mailcatcher as mail smtp server at development.
//https://mailcatcher.me/
//How:
//  Don't put mailcatcher into your Gemfile. It will conflict with your applications gems at some point.
//  ->$ gem install mailcatcher
//  ->$ mailcatcher
//  Go to http://localhost:1080/
//  Send mail through smtp://localhost:1025
//  Use mailcatcher --help to see the command line options.
