const path = require('path');
const webpack = require('webpack');

// webpackの出力モードの指定
const MODE = 'development';
// webpackの出力モードに伴いsourcemapを出力するかどうかを設定
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
        // Sassファイルの読み込みとコンパイル
        test: /\.scss/,
        use: [
          'style-loader',  // linkタグに出力する機能
          {
            loader: 'css-loader',  // CSSをバンドルする機能
            options: {
              // CSS内のurl()メソッドの取り込みを禁止
              url: false,
              sourceMap: enabledSourceMap,
              // postcss-loader, sass-loader
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
