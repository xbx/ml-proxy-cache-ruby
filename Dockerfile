FROM rails:5

WORKDIR /app/
COPY Gemfile /app/Gemfile

RUN bundle install

COPY . /app/

RUN bundle install --binstubs

EXPOSE 3000
CMD rails s





