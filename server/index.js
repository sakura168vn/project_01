const app = require('express')();
const server = require('http').createServer(app);
const options = { /* ... */ };
const io = require('socket.io')(server, options);
const port = 3484;

io.on('connection', client => {
    console.log(`New client connected`);
    client.on('fromClient', data => {console.log(data);
        //Bước 2: hứng dữ liệu từ client và tăng lên 1 đơn vị
        client.emit('fromServer', `${Number(data) + 1}`);
    });
    client.on('disconnect', () => console.log(`client disconnected`));
});

server.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});