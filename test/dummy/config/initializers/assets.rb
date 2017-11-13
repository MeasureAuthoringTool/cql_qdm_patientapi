# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( datatypes/*.js types/*.js utils/helpers.self.js cqlpatinet cql_qdm_patientapi vendor/moment/min/moment.min.self.js cql4browsers.self.js support/phantomjs-shims.self.js)
