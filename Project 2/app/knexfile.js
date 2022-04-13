module.exports = {
    development: {
      client: 'mysql',
      debug: true,
      connection: {
        host : '127.0.0.1',
        port : 3306,
        user : 'root',         // change to local user
        password : 'password', // change to local password
        database : 'parking_db'
      }
    }
  };