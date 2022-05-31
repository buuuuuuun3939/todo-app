FROM ruby:latest

RUN apt-get update -qq && apt-get install -y build-essential nodejs git

ENV APP_ROOT /todo-app2
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install
ADD . $APP_ROOT

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
#RUN rails new . --database=mysql --api
#RUN rm -f /myapp/tmp/pids/server.pid
#CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]

