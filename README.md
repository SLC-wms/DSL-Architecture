# DSL-Architecture

This repo features the development and documentation of the project's architecture and infrastructure, the methodology is based on the [C4 Model](https://c4model.com/) of [Simon Brown](https://github.com/simonbrowndotje/). The implementation of this architecture is developed with the [Structurizer DSL](https://github.com/structurizr/dsl.git) and deployed to github pages using the project [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr). Not sure how to reach out? Visit our Slack server, and remember to read our [Contributing Guidelines](https://github.com/SLC-wms/DSL-Architecture/tree/main/CONTRIBUTING.md)!

[![View the architecture](https://img.shields.io/badge/view_the_architecture!-2ea043?style=for-the-badge&logo=buddy&logoColor=ffffff)](https://SLC-wms.github.io/DSL-Architecture/main/)

## Local Workspace

Beforehand, you must have installed a way to run the Docker Daemon, such as [Docker Desktop](https://www.docker.com/products/docker-desktop/) or [Colima](https://github.com/abiosoft/colima), then start it as you will be using it in any of our alternatives. To work in local we recommend the use of [Structurizr Lite](https://github.com/structurizr/lite.git) for an easier experience, just follow these instructions:

```sh
git clone https://github.com/SLC-wms/DSL-Architecture
cd DSL-Architecture/src
DATA_FOLDER=$(pwd)
```

To this point you have been copied this repo and stored the workspace's location in the variable `DATA_FOLDER`. Now it comes the installation and running part exclusive to `Structurizr Lite`:

```sh
# Installation (internet connection required)
docker pull structurizr/lite

# Running
docker run -it --rm -p 8080:8080 -v $DATA_FOLDER:/usr/local/structurizr structurizr/lite
```

To this point, just open the [localhost](http://localhost:8080/workspace/diagrams) url and you are ready to go. To restart the render of your workspace, just reload the page in the browser.
