#!/usr/bin/env bash
# https://github.com/egoist/devdocs-desktop

# https://github.com/toiletbril/dedoc
# https://github.com/freeCodeCamp/devdocs
# git clone https://github.com/freeCodeCamp/devdocs.git && cd devdocs
# gem install bundler
# bundle install
# bundle exec thor docs:download --default
# bundle exec rackup
# Finally, point your browser at localhost:9292 (the first request will take a few seconds to compile the assets). You're all set.
#
# The thor docs:download command is used to download pre-generated documentations from DevDocs's servers (e.g. thor docs:download html css). You can see the list of available documentations and versions by running thor docs:list. To update all downloaded documentations, run thor docs:download --installed. To download and install all documentation this project has available, run thor docs:download --all.
#
# Note: there is currently no update mechanism other than git pull origin main to update the code and thor docs:download --installed to download the latest version of the docs. To stay informed about new releases, be sure to watch this repository.
#
# Alternatively, DevDocs may be started as a Docker container:
#
# # First, build the image
# git clone https://github.com/freeCodeCamp/devdocs.git && cd devdocs
# docker build -t thibaut/devdocs .
#
# # Finally, start a DevDocs container (access http://localhost:9292)
# docker run --name devdocs -d -p 9292:9292 thibaut/devdocs
# The command-line interface uses Thor. To see all commands and options, run thor list from the project's root.
#
# # Server
# rackup              # Start the server (ctrl+c to stop)
# rackup --help       # List server options
#
# # Docs
# thor docs:list      # List available documentations
# thor docs:download  # Download one or more documentations
# thor docs:manifest  # Create the manifest file used by the app
# thor docs:generate  # Generate/scrape a documentation
# thor docs:page      # Generate/scrape a documentation page
# thor docs:package   # Package a documentation for use with docs:download
# thor docs:clean     # Delete documentation packages
#
# # Console
# thor console        # Start a REPL
# thor console:docs   # Start a REPL in the "Docs" module
#
# # Tests can be run quickly from within the console using the "test" command.
# # Run "help test" for usage instructions.
# thor test:all       # Run all tests
# thor test:docs      # Run "Docs" tests
# thor test:app       # Run "App" tests
#
# # Assets
# thor assets:compile # Compile assets (not required in development mode)
# thor assets:clean   # Clean old assets
