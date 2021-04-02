# Development

	docker-compose up --build

# Debugging

Your docker-compose.yml should have two containers, one based on your custom WordPress image (referred to as wp below), and the other based on the official MySQL Image (referred to as db below). You should set it up such that wp uses db as its database.

You are required to make the following customisations (which involves editing your Dockerfile and adjust docker-compose.yml)

* enabling SSL connection from wp to db
* installing and enabling xdebug, which is a debugging tool for PHP.
* (bonus) embedding a YouTube video of your choice at the WordPress home page
* plus optionally a few other commands to inject data into db.
* You should document clearly instructions for developers on how to use the development environment you have set up in a README.md file in /project. In particular, you should include instructions on using xdebug.