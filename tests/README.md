<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Drawio, verified and packaged by Elestio

[Drawio](https://www.drawio.com/) is a JavaScript, client-side editor for general diagramming.

<img src="https://raw.githubusercontent.com/elestio-examples/drawio/main/drawio.png" alt="drawio" width="800">

[![deploy](https://github.com/elestio-examples/drawio/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/drawio)

Deploy a <a target="_blank" href="https://elest.io/open-source/drawio">fully managed Drawio</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/drawio.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:17851`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3"
    services:
        plantuml-server:
            image: plantuml/plantuml-server
            expose:
                - "8080"
            volumes:
                - ./fonts_volume:/usr/share/fonts/drawio
        image-export:
            image: jgraph/export-server:${SOFTWARE_VERSION_TAG}
            expose:
                - "8000"
            volumes:
                - ./fonts_volume:/usr/share/fonts/drawio
            environment:
                - DRAWIO_BASE_URL=${DRAWIO_BASE_URL}
        drawio:
            image: elestio4test/drawio:${SOFTWARE_VERSION_TAG}
            ports:
                - "172.17.0.1:17851:8080"
            links:
                - plantuml-server:plantuml-server
                - image-export:image-export
            depends_on:
                - plantuml-server
                - image-export
            environment:
                - DRAWIO_SELF_CONTAINED=1
                - PLANTUML_URL=http://plantuml-server:8080/
                - EXPORT_URL=http://image-export:8000/
                - DRAWIO_BASE_URL=${DRAWIO_BASE_URL}
                - DRAWIO_SERVER_URL=${DRAWIO_SERVER_URL}
                - DRAWIO_CSP_HEADER=${DRAWIO_CSP_HEADER}
                - DRAWIO_VIEWER_URL=${DRAWIO_VIEWER_URL}
                - DRAWIO_LIGHTBOX_URL=${DRAWIO_LIGHTBOX_URL}
                - DRAWIO_CONFIG=${DRAWIO_CONFIG}
                - DRAWIO_GOOGLE_CLIENT_ID=${DRAWIO_GOOGLE_CLIENT_ID}
                - DRAWIO_GOOGLE_APP_ID=${DRAWIO_GOOGLE_APP_ID}
                - DRAWIO_GOOGLE_CLIENT_SECRET=${DRAWIO_GOOGLE_CLIENT_SECRET}
                - DRAWIO_GOOGLE_VIEWER_CLIENT_ID=${DRAWIO_GOOGLE_VIEWER_CLIENT_ID}
                - DRAWIO_GOOGLE_VIEWER_APP_ID=${DRAWIO_GOOGLE_VIEWER_APP_ID}
                - DRAWIO_GOOGLE_VIEWER_CLIENT_SECRET=${DRAWIO_GOOGLE_VIEWER_CLIENT_SECRET}
                - DRAWIO_MSGRAPH_CLIENT_ID=${DRAWIO_MSGRAPH_CLIENT_ID}
                - DRAWIO_MSGRAPH_CLIENT_SECRET=${DRAWIO_MSGRAPH_CLIENT_SECRET}
                - DRAWIO_MSGRAPH_TENANT_ID=${DRAWIO_MSGRAPH_TENANT_ID}
                - DRAWIO_GITLAB_ID=${DRAWIO_GITLAB_ID}
                - DRAWIO_GITLAB_SECRET=${DRAWIO_GITLAB_SECRET}
                - DRAWIO_GITLAB_URL=${DRAWIO_GITLAB_URL}
                - DRAWIO_CLOUD_CONVERT_APIKEY=${DRAWIO_CLOUD_CONVERT_APIKEY}

### Environment variables

|       Variable       |   Value (example)    |
| :------------------: | :------------------: |
| SOFTWARE_VERSION_TAG |        latest        |
|    ADMIN_PASSWORD    |    your-password     |
|  DRAWIO_SERVER_URL   | https://your.domain/ |
|   DRAWIO_BASE_URL    | https://your.domain  |

# Maintenance

## Logging

The Elestio Drawio Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://www.drawio.com/doc/">Drawio documentation</a>

- <a target="_blank" href="https://github.com/jgraph/drawio">Drawio Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/drawio">Elestio/Drawio Github repository</a>
