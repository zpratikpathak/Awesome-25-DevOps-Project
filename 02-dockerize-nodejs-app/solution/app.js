const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.send('<h1>Hello from Dockerized Node.js App!</h1><p>DevOps Project 02 Success.</p>');
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
