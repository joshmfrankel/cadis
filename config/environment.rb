require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require 'letter_opener'
require_relative '../lib/cadis'
require_relative '../apps/web/application'

require_relative './initializers/i18n'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/cadis_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/cadis_development'
    #    adapter :sql, 'mysql://localhost/cadis_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/cadis/mailers'

    # See https://guides.hanamirb.org/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: https://guides.hanamirb.org/projects/logging
    logger level: :debug

    mailer do
      delivery LetterOpener::DeliveryMethod, location: File.expand_path('../tmp/letter_opener', __FILE__)
    end
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
