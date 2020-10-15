
const kubemq = require('kubemq-nodejs');
const exportProcess = require('./export')


let queueName = 'meeting', clientID = 'test-queue-client-id2',
    kubeMQAddress = '192.168.20.22:30936';
let queue = new kubemq.Queue(kubeMQAddress, queueName, clientID);

exportProcess.start("http://bbbmain4.uzep.org/playback/presentation/2.0/playback.html?meetingId=366ff86bf75ff4ca49f43391ca5ce4b449eb0746-1602512438761","test.mp4",1,"true");

queue.receiveQueueMessages(2, 1).then(res => {
    if (res.Error) {
        console.log('Message enqueue error, error:' + res.message);
    } else {
        if (res.MessagesReceived) {
            console.log('Received: ' + res.MessagesReceived);
            res.Messages.forEach(element => {
                console.log('MessageID:' + element.MessageID);
                console.log(kubemq.byteToString(element.Body));
                console.log(element);

                
            });
        } else {
            console.log('No messages');
        }
    }
}).catch(
    err => console.log('Error:' + err));

    