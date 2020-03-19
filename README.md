## Getting Started

### Starting and Stopping SQL Server Docker Container

Ensure you have latest version of docker installed on your machine. In your terminal, ensure you are in the root directory of this project (because this is where the `docker-compose.yml` file is) and run the following command:

```bash
docker-compose up -d
```

When you would like to stop running this container, run the following command in the same directory:

```bash
docker-compose down
```

### Installing Flyway

For MacOS: Use brew for an easy way to manage the flyway CLI.

```bash
brew install flyway
```

For Windows: Donwload the ZIP file from the [flyway site](https://flywaydb.org/documentation/commandline/). Inside the unzipped flyway folder, there will be an executable file called `flyway`. It's up to you how you want to setup the flyway command on your machine.

### Replicating Schemas and Tables

If this is your first time running the DB locally on your machine, please remember to run the migration scripts in the docker container to replicate all necessary schemas and tables required to run Advisor Portal applications locally, as well as update the respective local configserver files to point to the docker container.

> REQUIREMENTS: You will need a docker image with mssql running locally and flyway in order for the configs to work.

```sql
-- if this is the first time running, create the database listed in flyway/local-flyway.conf
-- (build-db-local)
CREATE DATABASE [build-db-local]
```

```bash
# After the database is created, run baseline and migrate
flyway -configFiles=./flyway/local-flyway.conf baseline
flyway -configFiles=./flyway/local-flyway.conf migrate

# You can check that your migrations ran by checking your tables in the database
# or you can run a flyway command and seeing a table
flyway -configFiles=./flyway/local-flyway.conf info

```
