web: bundle exec puma -t 5:5 -p ${PORT:-8080} -e ${RACK_ENV:-production}
release: bin/rails db:migrate
