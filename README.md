# gocd-docker

A dockerized implementation of gocd using using docker-enabled agents

## Setup

### Prerequisites

1. `brew update`
2. `brew install docker-toolbox`
3. `. ./setup.sh` (or see details below)

### Deployment

To start the default stack with one agent:

1. `docker-compose up`

If you want to scale agents (three in this example):

1. `docker-compose scale gocd-agent=3`

## Configuration

I would suggest using the following template as a base when creating a pipeline (this can be added to your `cruise-config.xml`):

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
                docker run "localhost:5000/$GO_PIPELINE_NAME:$GO_REVISION" test
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
    <stage name="deploy" cleanWorkingDir="true">
      <jobs>
        <job name="deploy">
          <tasks>
            <exec command="bash">
              <arg>-c</arg>
              <arg>
                docker run "localhost:5000/$GO_PIPELINE_NAME:$GO_REVISION" deploy
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
