**Monitoring and Observability**

**Monitoring:**

We are monitoring service and its response time, if it has any issues, we can get that done again. We can setup a intergration with any apps like slack or jira to notify us.


<img width="435" alt="image" src="https://github.com/user-attachments/assets/8af4eb69-ba22-4674-b3cc-a68735fcf577">

What to monitor. 

Observing all can't be efficient. Tracking based upon on applications. 

4 main things to observe:4Golden Signals

1. Latency
2. Traffic
3. Errors and
4. Saturation

**These 4 provide a high-level overview of the health and user experience of a system**
 
**Latency**: It measures, the time it takes for a request to travel from the client to the server and back. Lower Latency is best.

**Traffic** : number of requests to a system receives over a specific period. 

**Errors** : Percentage of requesting resulting in errors, such as 404(page not found), 500(internal server error). The high error rate is note considered as a good one. Developers need to take care of the code.

**Saturation** : This measures the resource utilization of CPU, memory, and hard disk. This helps to eliminate the performance degradation of a server.

<img width="887" alt="image" src="https://github.com/user-attachments/assets/70764fc2-7f81-4603-94fb-09dd68101a81">


**O11y -> Observability**

3 Pillars of Obserability

1. Logs
2. Traces and
3. Metrics
   
The more we have above 3 principles in our code, the more we can discover the issue and improve the code and fix it

**Logs** : Application logs, in the backend server  For lOgs, tools like Elastic search, logstash, Loki

**Metrics** : Quantitative measurements that offer a snapshot of a system's performance over time. This includes numerical values like response time, error rate and response time
Metrics is collected by k8s nodes, service, pods.

**Traces** : in mirocservice, one service to another service  Traces helps to understand the flow and improve in future.

In monitoring, "traces" refer to the detailed records of the execution flow of requests through a distributed system. They provide insights into how requests propagate through various services, applications, or components within an architecture. Tracing is an essential part of observability, which also includes metrics and logs.

<img width="482" alt="image" src="https://github.com/user-attachments/assets/5099bebc-e84b-4a02-978c-ff42d779f5f9">

  


![Screenshot (79)](https://github.com/user-attachments/assets/e0ad9b35-3fb4-4c6f-b572-96df9b03b2d9)

Monitoring gives the alert while observability gives you the root cause and exact problem in which service.

<img width="460" alt="image" src="https://github.com/user-attachments/assets/476d1f90-efae-4d23-8965-a294a0832e9e">

