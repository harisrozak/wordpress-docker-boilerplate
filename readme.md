# WordPress Docker Boilerplate

A minimal Docker Compose setup for local WordPress development with MySQL and Adminer.

## Services

| Service   | Description                        | Default Port |
|-----------|------------------------------------|--------------|
| WordPress | WordPress (Apache)                 | `8080`       |
| MySQL     | MySQL 8.0 database                 | —            |
| Adminer   | Database management UI             | `8081`       |

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. **Clone the repository**

   ```bash
   git clone <repo-url>
   cd wordpress-docker-boilerplate
   ```

2. **Create a `.env` file**

   ```bash
   cp .env.example .env
   ```

   Edit `.env` to set your credentials and ports:

   ```env
   PORT=8080
   ADMINER_PORT=8081

   WORDPRESS_DB_USER=wordpress
   WORDPRESS_DB_PASSWORD=wordpress
   WORDPRESS_DB_NAME=wordpress

   MYSQL_DATABASE=wordpress
   MYSQL_USER=wordpress
   MYSQL_PASSWORD=wordpress
   ```

3. **Run the install script**

   ```bash
   bash install.sh
   ```

   This will:
   - Create `plugins/` and `themes/` directories
   - Set directory permissions
   - Start all containers in detached mode

4. **Open in browser**

   - WordPress: [http://localhost:8080](http://localhost:8080)
   - Adminer: [http://localhost:8081](http://localhost:8081)

## Project Structure

```
.
├── compose.yaml      # Docker Compose service definitions
├── install.sh        # Setup and startup script
├── plugins/          # Mounted into WordPress plugins directory
├── themes/           # Mounted into WordPress themes directory
└── .env              # Environment variables (not committed)
```

## Volume Mounts

| Host Path  | Container Path                        |
|------------|---------------------------------------|
| `./plugins` | `/var/www/html/wp-content/plugins`   |
| `./themes`  | `/var/www/html/wp-content/themes`    |

WordPress core files and the database are stored in named Docker volumes (`wordpress`, `db`) and persist across restarts.

## Stopping & Cleaning Up

Stop containers:

```bash
docker compose down
```

Stop and remove all data (volumes):

```bash
docker compose down -v
```

Start again after stopping:

```bash
docker compose up -d
```
