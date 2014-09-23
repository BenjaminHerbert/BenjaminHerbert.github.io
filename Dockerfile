#
# Ubuntu 14.04 with jekyll
# Put the content into the folder "content"
#
FROM ubuntu:14.04
MAINTAINER Benjamin Herbert <benjamin@herbert.cc>

# Date of last refresh - update this and rebuild to force updating the image 
RUN apt-get update
ENV REFRESHED_AT 2014-09-16

RUN apt-get -y install make g++ python git ruby ruby-dev
RUN gem install bundler therubyracer jekyll

ADD Gemfile /content/Gemfile
WORKDIR content
RUN bundle install

ADD . /content

VOLUME ["/content"]

WORKDIR /content

EXPOSE 4000
