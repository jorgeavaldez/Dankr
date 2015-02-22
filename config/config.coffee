path     = require 'path'
rootPath = path.normalize __dirname + '/..'
env      = process.env.NODE_ENV || 'development'

config =
  development:
    root: rootPath
    app:
      name: 'dankr'
    port: 3000
    db: 'mongodb://localhost/dankr-development'

  test:
    root: rootPath
    app:
      name: 'dankr'
    port: 3000
    db: 'mongodb://localhost/dankr-test'

  production:
    root: rootPath
    app:
      name: 'dankr'
    port: 3000
    db: 'mongodb://localhost/dankr-production'

module.exports = config[env]
