namespace :dev do
  desc 'Creates some sample data for running in development locally'
  task prime: 'db:migrate' do
    require 'database_cleaner'
    require 'factory_girl_rails'

    include FactoryGirl::Syntax::Methods

    if Rails.env != "development"
      raise "This task can only be create in the development environment"
    end

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

    puts "Creating development data..."

    setup_bookmarks
    setup_units
    setup_users
  end

  def setup_bookmarks
    create_list(:bookmark, 15)
  end

  def setup_units
    create_list(:unit, 15)
  end

  def setup_users
    user = create(:user, email: 'user@example.com')
    puts "User login: #{user.email} / #{user.password} / #{user.api_key}"
  end
end
