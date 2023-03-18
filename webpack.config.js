const path = require('path');
const webpack = require('webpack');

const MODE = 'development';
const enabledSourceMap = MODE === 'development';

module.exports = {
  mode: MODE,
  devtool: 'source-map',
  entry: {
    application: './app/javascript/application.js',
  },
  output: {
    filename: '[name].js',
    sourceMapFilename: '[file].map',
    path: path.resolve(__dirname, 'app/assets/builds'),
  },
  module: {
    rules: [
      {
        test: /\.scss/,
        use: [
          'style-loader',
          {
            loader: 'css-loader',
            options: {
              url: false,
              sourceMap: enabledSourceMap,
              importLoaders: 2
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: enabledSourceMap
            },
          },
        ],
      },
    ],
  },
};
