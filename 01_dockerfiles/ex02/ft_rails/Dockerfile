FROM ruby

ONBUILD COPY yoo /opt/app/
ONBUILD WORKDIR /opt/app

RUN apt-get update -y && apt-get install -y build-essential libpq-dev nodejs sqlite3 gem

ONBUILD EXPOSE 3000
ONBUILD RUN bundle install
ONBUILD RUN rake _12.3.1_ db:migrate
ONBUILD RUN rake _12.3.1_ db:seed
