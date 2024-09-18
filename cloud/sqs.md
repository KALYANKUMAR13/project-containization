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

Standart and FIFO Queues

![image](https://github.com/user-attachments/assets/def8ab8d-ddaf-480d-bef0-a17e0748bd1e)

The producer is the entity (such as an application, microservice, or system component) that sends messages to the SQS queue.

Consumers poll the queue for messages, process them, and then delete them from the queue once processing is complete. If a message cannot be processed, it may be retried or moved to a Dead Letter Queue (DLQ) depending on the configuration.


SNS:

Similar to SQS

Message enter the queue and there are many services that polls the messages and process them

![image](https://github.com/user-attachments/assets/78c79abe-d3bd-40f5-8926-056374fa1efa)

Long Polling - 

![image](https://github.com/user-attachments/assets/fd506597-b228-4ae5-ae53-4a9120f1d174)





