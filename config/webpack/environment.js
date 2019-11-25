const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default'],
        Slider: 'bootstrap-slider'
    })
)

module.exports = environment
