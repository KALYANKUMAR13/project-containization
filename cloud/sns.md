SNS - Simple Notification Service


1. Topics - central palce, where it gets the messages from all the services and make a exact copy of the message provide to all **Subscribers** (which want particular message.

There can be 'N' number of subscribers, a copy of the message is sent from the topic.


![image](https://github.com/user-attachments/assets/3387ad31-fe49-44a5-b0a3-b6c2e86ee375)


After a copy is send to all the subscribers, it will disappear.

What if any of the subscribers is not up  or not availiable for 2 days, so we place a SQS in-front of the subscribers, so that it holds the messages, untill it get processed.

![image](https://github.com/user-attachments/assets/de6fd331-8ee4-4603-9112-8d349402cf92)

