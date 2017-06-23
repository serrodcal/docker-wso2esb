# docker-wso2esb

Docker image to install and run WSO2 Enterprise Service Bus. Forked from isim/wso2esb.

## Description
The Dockerfile will:

* Use `wget` to pull the ESB 5.0.0 ZIP from a S3 bucket into the container `/opt` folder.
* Install `zip`.
* Unzip the ESB 5.0.0 ZIP.
* Remove the ESB 5.0.0 ZIP.
* Expose the container port `9443`, `9763`, `8243`, `8280`.
* Set the `wso2server.sh` start-up script as the container start-up entrypoint.
* Set osgiConsole.
* Be able to deploy mediators (in artifacts/), dropins and libs.
* Be able to deploy Carbon Apps.

## Usage

Clone this repo in your local.

Use internal script in `scripts/`:

* `./scripts/build.sh`
* `./scripts/run.sh`
* `./scripts/start.sh`
* `./scripts/stop.sh`
* `./scripts/clean.sh`

Check permissions or make `chmod 775 scripts/<script_name>.sh`.

Or, you can use this others:

* Build image: `docker build -t serrodcal/wso2esb-5.0.0 .`

* Run container: `docker run -d --name esb -p 9443:9443 -p 8280:8280 -p 8243:8243 -p 19444:19444 serrodcal/wso2esb-5.0.0`

To access web admin console, navigate to `https://localhost:9443` using your web browser.

To access OSGi Console, type `telnet localhost 19444` in console.

## Deploying your mediators

Copy mediators `.jar` files into /artifacts, Apache Felix works for us.

If you need dropins or libs for the mediator put them in dropins/ or lib/.

## Test

```
curl -i -X POST \
   -H "Content-Type:application/json" \
   -d \
'{"example":"example"}' \
 'http://localhost:8280/echo/echo'
```

## License
Refer to the [LICENSE](LICENSE) file. WSO2 license can be found [here](http://wso2.com/licenses).
