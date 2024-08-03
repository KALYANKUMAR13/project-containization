**Prometheus Architecture**

Core component is Prometheus Server -> Responsible of collecting metrics form various application, clusters and db instances.

By default, tsdb stores for 15 days, but it can be increased with further configurations.

![Screenshot (84)](https://github.com/user-attachments/assets/a496ed4b-b265-4933-8083-189379936e3c)

**Instrumentation:**

Writing custom code to collect metrics form particular service.

In mongodb, linux systems, we can't use the custome code => there comes the **exporter**.

This exporters helps to get the existing metics from the particular system and convert them to prometheus compactable format and expose them to HTTP endpoit - Node exporter(In linux),Mongodb exporter
Prometheus pulls the metics form the  exporters and get the data 

<img width="391" alt="image" src="https://github.com/user-attachments/assets/2b64b5fa-44fd-478d-bb72-8d7e81c62537">

For short living application, like they have their purpose and after the purpose it will server will be shutdown. 

For this kind of shot lived application, promethus has **pushgateway**

![Screenshot (85)](https://github.com/user-attachments/assets/61de07f6-bd2f-46d4-85a2-c4739b3e0796)


Nowadays, in the world of k8s, we are crating n number of pods of particular service,-> creating a new pod and deleting it.

For the above challenge, service discovery takes care the pod creation and deletion and scrape the data to the prometheus server.

![Screenshot (86)](https://github.com/user-attachments/assets/72088903-c430-4447-8bc8-b995fd63a1e5)



By default, the port is 9090 for visualizing it 

![Screenshot (87)](https://github.com/user-attachments/assets/a2e34fc9-dd36-45c2-9bcd-d8dadae99054)

Alert manager.
Here we need t write , when some certain conditions are meet, notification is triggered
![Screenshot (88)](https://github.com/user-attachments/assets/68e0e872-1ae3-4b3e-98a0-19c37a8aedad)



 
 
