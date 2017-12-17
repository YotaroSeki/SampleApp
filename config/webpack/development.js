const environment = require('./environment')
const shared = require('./shared')
const merge = require('webpack-merge')

const config = merge(environment.toWebpackConfig(), shared)
module.exports = config
