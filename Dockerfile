FROM ruby:2.7.4

# ruby-dev / ruby-devel
RUN apt-get update -qq && apt-get install -y \
  curl \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  gnupg2 \
  wget \
  ruby-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp
WORKDIR /myapp

# Копируем файлы зависимостей
COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./
COPY init.sql /docker-entrypoint-initdb.d/

# Устанавливаем зависимости
#RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install && yarn install --check-files
#RUN bundle update

# Копируем остальные файлы приложения
COPY . ./

# Указываем точку входа для контейнера
# ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]