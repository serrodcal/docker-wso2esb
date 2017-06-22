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
* Set osgiConsole
* Be able to deploy mediators (in artifacts/), dropins and libs.

## Usage
To run the WSO2 ESB:
```
docker run -d --name esb -p 9443:9443 -p 8280:8280 -p 8243:8243 -p 19444:19444 serrodcal/wso2esb-5.0.0
````
To access web admin console, navigate to `https://localhost:9443` using your web browser.

To access OSGi Console, type `telnet localhost 19444` in console.

## License
Refer to the [LICENSE](LICENSE) file. WSO2 license can be found [here](http://wso2.com/licenses).
