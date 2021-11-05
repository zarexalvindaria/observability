**Note:** For the screenshots, you can store all of your answer images in the `answer-img` directory.

## Verify the monitoring installation

*TODO:* run `kubectl` command to show the running pods and services for all components. Take a screenshot of the output and include it here to verify the installation

#### All Namespaces

<img src="https://raw.githubusercontent.com/zarexalvindaria/observability/main/images/pods_svc_all_ns.png">

#### Monitoring

<img src="https://raw.githubusercontent.com/zarexalvindaria/observability/main/images/pods_svc_monitoring_namespace.png">

#### Observability

<img src="https://raw.githubusercontent.com/zarexalvindaria/observability/main/images/pods_svc_observability_namespace.png">


## Setup the Jaeger and Prometheus source
*TODO:* Expose Grafana to the internet and then setup Prometheus as a data source. Provide a screenshot of the home page after logging into Grafana.

<img src="https://raw.githubusercontent.com/zarexalvindaria/observability/main/images/grafana_.png">

## Create a Basic Dashboard
*TODO:* Create a dashboard in Grafana that shows Prometheus as a source. Take a screenshot and include it here.

<img src="https://raw.githubusercontent.com/zarexalvindaria/observability/main/images/basic_dashboard_1.png">

<img src="https://raw.githubusercontent.com/zarexalvindaria/observability/main/images/basic_dashboard_2.png">

## Describe SLO/SLI
*TODO:* Describe, in your own words, what the SLIs are, based on an SLO of *monthly uptime* and *request response time*.

SLIs or Service Level Indicators are measurable indicators of how the application/website/service is faring compared to the set promise of the organization to its customers and stakeholders. This promise is also known as SLOs or Service Level Objectives. 

An example SLI for a monthly uptime is the rate of the 20x or 30x (valid requests) responses of the website in a total incoming requests per month. For example, the average 20x or 30x responses of the web application for the month of October 2021 is 97.99%.

On the other hand, the SLI for a request response time is how long the request took to be served. For example, it took an average of 700ms for incoming requests to be served in the month of October 2021.

## Creating SLI metrics.
*TODO:* It is important to know why we want to measure certain metrics for our customer. Describe in detail 5 metrics to measure these SLIs. 

1. The average 20x or 30x responses of the web application for the month of October 2021 is 97.99%.
2. It took an average of 700ms for incoming requests to be served for the month of October 2021.
3. 1.5% of the total incoming requests had 50x responses for the month of October 2021.
4. The average CPU usage of the web application for the month of October 2021 is 83.67%.
5. The login requests in the web application for the month of October 2021 took an average of 2 seconds to be served.

## Create a Dashboard to measure our SLIs
*TODO:* Create a dashboard to measure the uptime of the frontend and backend services We will also want to measure 40x and 50x errors. Create a dashboard that show these values over a 24 hour period and take a screenshot.

PromQL Commands:

1. Average 20x/30x: 
   1. To get count: prometheus_http_requests_total{code=~"2.*"}  and prometheus_http_requests_total{code=~"3.*"} 
   2. To get the average: sum(prometheus_http_requests_total{code=~"2.*"})/sum(prometheus_http_requests_total)
   3. Second metric: sum(prometheus_http_requests_total{code=~"3.*"})/sum(prometheus_http_requests_total)
2. Average incoming requests response: 
   1. sum(rate(prometheus_http_request_duration_seconds_sum[5m])) / sum(rate(prometheus_http_request_duration_seconds_count[5m]))
   2. sum(prometheus_http_request_duration_seconds_count) / sum(prometheus_http_request_duration_seconds_sum)
3. Average 50x:  prometheus_http_requests_total{code=~"5.*"}
4. CPU usage: rate(process_cpu_seconds_total[5m])
5. Login requests response: 



rate(prometheus_http_requests_total{code="200"}[1m])



## Tracing our Flask App
*TODO:*  We will create a Jaeger span to measure the processes on the backend. Once you fill in the span, provide a screenshot of it here.

## Jaeger in Dashboards
*TODO:* Now that the trace is running, let's add the metric to our current Grafana dashboard. Once this is completed, provide a screenshot of it here.

## Report Error
*TODO:* Using the template below, write a trouble ticket for the developers, to explain the errors that you are seeing (400, 500, latency) and to let them know the file that is causing the issue.

TROUBLE TICKET

Name:

Date:

Subject:

Affected Area:

Severity:

Description:


## Creating SLIs and SLOs
*TODO:* We want to create an SLO guaranteeing that our application has a 99.95% uptime per month. Name three SLIs that you would use to measure the success of this SLO.



## Building KPIs for our plan
*TODO*: Now that we have our SLIs and SLOs, create KPIs to accurately measure these metrics. We will make a dashboard for this, but first write them down here.



## Final Dashboard
*TODO*: Create a Dashboard containing graphs that capture all the metrics of your KPIs and adequately representing your SLIs and SLOs. Include a screenshot of the dashboard here, and write a text description of what graphs are represented in the dashboard.  
