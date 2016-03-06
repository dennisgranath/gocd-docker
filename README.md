# gocd-docker

A dockerized implementation of gocd using using docker-enabled agents

## Deployment

### Prerequisites

This project is deployed with Docker. The easiest way to setup a Docker environment is by installing the [Docker Toolbox](https://www.docker.com/docker-toolbox).

### Docker Compose

1. `. setup.sh`
2. `docker-compose up`

If you want to scale agents (three in this example):

1. `docker-compose scale gocd-agent=3`

## Configuration

I would suggest using the following template when creating a pipeline (this can be added to your `cruise-config.xml`):

```xml
<templates>
  <pipeline name="docker">
    <stage name="build" cleanWorkingDir="true">
      <jobs>
        <job name="build">
          <tasks>
            <exec command="bash">
              <arg>-c</arg>
              <arg>
                docker build --tag "localhost:5000/$GO_PIPELINE_NAME:$GO_REVISION" . &amp;&amp;
                docker push "localhost:5000/$GO_PIPELINE_NAME:$GO_REVISION"
              </arg>
              <runif status="passed" />
            </exec>
          </tasks>
        </job>
      </jobs>
    </stage>
    <stage name="test" cleanWorkingDir="true">
      <jobs>
        <job name="test">
          <tasks>
            <exec command="bash">
              <arg>-c</arg>
              <arg>
                (export IMAGE_VERSION=$GO_REVISION; docker-compose pull &amp;&amp; docker-compose run --rm $GO_PIPELINE_NAME test &amp;&amp; docker-compose down --rmi all --volumes)
              </arg>
              <runif status="passed" />
            </exec>
          </tasks>
        </job>
      </jobs>
    </stage>
    <stage name="push" cleanWorkingDir="true">
      <jobs>
        <job name="push">
          <tasks>
            <exec command="bash">
              <arg>-c</arg>
              <arg>
                docker tag --force "localhost:5000/$GO_PIPELINE_NAME:$GO_REVISION" "localhost:5000/$GO_PIPELINE_NAME:latest" &amp;&amp;
                docker push "localhost:5000/$GO_PIPELINE_NAME:latest"
              </arg>
              <runif status="passed" />
            </exec>
          </tasks>
        </job>
      </jobs>
    </stage>
  </pipeline>
</templates>
```
