var db = require('../db');

module.exports = {
  messages: {
    get: function (callback) {
      var string = 'SELECT messages.id, messages.text, messages.roomname, users.username FROM messages \
                    INNER JOIN users ON (messages.userid = users.id) \
                    ORDER BY messages.id DESC';
      db.query(string, (error, results) => callback(error, results));
    },
    post: function (data, callback) {
      var string = 'INSERT INTO messages(text, userid, roomname) \
                    VALUE (?, (SELECT id FROM users WHERE username = ? LIMIT 1), ?)';
      db.query(string, data, (error, results) => callback(error, results));
    }
  },

  users: {
    get: function (callback) {
      var string = 'SELECT * FROM users';
      db.query(string, (error, results) => callback(error, results));
    },
    post: function (data, callback) {
      var string = 'INSERT INTO users(username) VALUE (?)';
      db.query(string, data, (error, results) => callback(error, results));
    }
  }
};