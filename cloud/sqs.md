![image](https://github.com/user-attachments/assets/b9095860-8c2b-4b10-8300-ece9d320a525)


When some one sending a request to a API, What if the API is down, the SQS gete the message or payload and hold it. Whenever the API or service is up, It will process and return it.

**Poll** : The APi hits the SQS service and looks for any messages. From APi, it watches the SQS continously.

One message is processed at a time.

Workflow:

1. A messages is published to a queue.
2. Meaasage is claimed by the **receiver** and the **visibility timeout** countdown starts.


![image](https://github.com/user-attachments/assets/85d60a85-c7cb-4b9d-9da6-6df792074b19)


The visibility timeout is a threshold period, within that amount of period, message should process it  or else, the message is released and put back into the queue.


![image](https://github.com/user-attachments/assets/90596ebf-cbc1-4bc8-adf1-b7c644048e9a)
