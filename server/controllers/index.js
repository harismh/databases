var models = require('../models');

module.exports = {
  messages: {
    get: function (req, res) {
      models.messages.get((error, response) => {
        if (error) {
          console.log('error at controller messages get');
          throw error;
        } else {
          res.writeHead(200, 'success');
          res.end(JSON.stringify(response));
        }
      });
    }, // a function which handles a get request for all messages
    post: function (req, res) {
      models.messages.post([req.body.message, req.body.username, req.body.roomname], (error , response) => {
        if (error) {
          console.log('error at controller messages post');
          throw error;
        } else {
          res.writeHead(201, 'success');
          res.end();
        }
      });
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {
      models.users.get((error, response) => {
        if (error) {
          console.log('error at controller users get');
          throw error;
        } else {
          res.writeHead(200, 'success');
          res.end(JSON.stringify(response));
        }
      });
    },
    post: function (req, res) {
      models.users.post([req.body.username], (error, response) => {
        if (error) {
          console.log('error at controller users post');
          throw error;
        } else {
          res.writeHead(201, 'success');
          res.end();
        }
      });
    }
  }
};

