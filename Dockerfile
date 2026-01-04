FROM ruby:2.7

# 避免 Bundler 版本不一致
RUN gem install bundler -v 2.3.12

# 安装依赖（会严格按 Gemfile.lock）
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 拷贝站点源码
COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]