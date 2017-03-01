This is backend for Shop project based on RubyOnRails 5 API mode;

I'm using gem 'devise_token_auth' for backend
//instructions if you need at https://github.com/lynndylanhurley/devise_token_auth

You will be needed the config/secrets.yml file that will be looking like:
//////////////////////////////////////
development:
  secret_key_base: aff179529ac59530bf83c7a37..............................3c7806f76f2cd8f33c2fd6a14b6a71b99294acb4

test:
  secret_key_base: 368bea77a9a2b6e0131ce8d7f..............................78eb152c274112686179da0053d3ce3b09f4d317

# Do not keep production secrets in the repository,
# instead read values from the environment.
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
//////////////////////////////////////
// to generate your own secret key run -> rails secret

I'm using mailcatcher as mail smtp server at development.
https://mailcatcher.me/
How:
//  Don't put mailcatcher into your Gemfile. It will conflict with your applications gems at some point.
//  ->$ gem install mailcatcher
//  ->$ mailcatcher
//  Go to http://localhost:1080/
//  Send mail through smtp://localhost:1025
//  Use mailcatcher --help to see the command line options.


I had an issue with bcrypt: cannot load such file -- bcrypt_ext on my windowsOS.
Solution is:
// Uninstall all bcrypt gem versions with "gem uninstall bcrypt" and select option 3 (if exist)
// Uninstall all bcrypt-ruby gem versions with "gem uninstall bcrypt-ruby" and select option 3 (if exist)
//// if you facing problem with uninstalling bcrypt gem with error: gem Uninstallation aborted due to dependent gem(s) -> then try running this command "gem list bcrypt | cut -d" " -f1 | xargs gem uninstall -aIx"
// Then install bcrypt using "gem install bcrypt --platform=ruby".


To run the project:
// For the first run -> rails db:create
//-> rails db:migrate
// rails s