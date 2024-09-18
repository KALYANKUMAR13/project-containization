![image](https://github.com/user-attachments/assets/b9095860-8c2b-4b10-8300-ece9d320a525)


When some one sending a request to a API, What if the API is down, the SQS gete the message or payload and hold it. Whenever the API or service is up, It will process and return it.

**Poll** : The APi hits the SQS service and looks for any messages. From APi, it watches the SQS continously
