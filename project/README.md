# Development

To start a local WordPress server for local development, run the following command
from the terminal

	docker-compose up --build

Once that's started, you can access it from a browser at http://localhost:8080

```
project
├── README.md
├── docker-compose.yaml
├── db
│   ├── development.sql
│   ├── production.sql
│   └── staging.sql
└── wp-content
    ├── mu-plugins
    ├── plugins
    └── themes
```

* Public or custom plugins should go into `plugins` folder
* Themes should go into `themes` folder
* Plugins that must be installed automatically should go into `mu-plugins` folder

# Debugging

In particular, you should include instructions on using xdebug.

# Staging


# Production
