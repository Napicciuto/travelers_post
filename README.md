# Travelers Post

## The Challenge
Post to Wall
Using Ruby on Rails, Javascript, and SQLite, create a working application that allows users to post comments to a wall without authentication. The wall shows a list of prior comments, comment count, and new comment form.
The new post form should be submitted to the Rails side via AJAX and update the comment and list counts without refreshing the page. The posts should include name (required), email (optional), and comment (required). Displayed posts should display all this info and the post creation time in Mountain Time. If a user specifies their email, show their Gravatar image next to their name. Otherwise, do not show an image.

## To run in docker

```
docker-compose build
docker-compose run app bundle exec rake db:setup
docker-compose up
```
### test with docker
```
docker-compose run app bundle exec rspec
```

## To run locally

```
bundle exec rake db:setup
bundle exec thin start
```

