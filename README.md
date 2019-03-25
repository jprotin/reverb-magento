## Docker with Reverb module

Use docker for magento 1 with the Reverb module : https://github.com/reverbdotcom/reverb-magento

## How to use

### Use Docker Compose

[Docker Compose](https://docs.docker.com/compose/) is the recommended way to run this image with MySQL database.

Then use `docker-compose up -d` to start MySQL and Magento server.

## Magento installation script

A Magento installation script is also provided as `/usr/local/bin/install-magento`. This script can install Magento without using web UI. This script requires certain environment variables to run:

Environment variable      | Description | Default value (used by Docker Compose - `env` file)
--------------------      | ----------- | ---------------------------
MYSQL_HOST                | MySQL host  | mysql
MYSQL_DATABASE            | MySQL db name for Magento | magento
MYSQL_USER                | MySQL username | magento
MYSQL_PASSWORD            | MySQL password | magento
MAGENTO_LOCALE            | Magento locale | en_GB
MAGENTO_TIMEZONE          | Magento timezone |Pacific/Auckland
MAGENTO_DEFAULT_CURRENCY  | Magento default currency | NZD
MAGENTO_URL               | Magento base url | http://localhost:8040
MAGENTO_ADMIN_FIRSTNAME   | Magento admin firstname | Admin
MAGENTO_ADMIN_LASTNAME    | Magento admin lastname | MyStore
MAGENTO_ADMIN_EMAIL       | Magento admin email | admin@example.com
MAGENTO_ADMIN_USERNAME    | Magento admin username | admin
MAGENTO_ADMIN_PASSWORD    | Magento admin password | admin123

## Modman
Modman is a [Magento module manager](https://github.com/colinmollenhour/modman) that allows you to leave your work siloed from the actual Magento codebase via symlinks. With modman, you can sync plugin or theme work without keeping a persistent volume (or using a hidden volume).

And to update the module:
```bash
modman update reverb-magento
```