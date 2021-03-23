echo ' more details: visit: https://lostechies.com/derekgreer/2017/05/25/hello-react-a-beginners-setup-tutorial/ '

mkdir hello-react
cd hello-react
npm init --yes
npm install --save-dev react react-dom babel-core babel-loader@7 babel-preset-es2015 babel-preset-react
npm install webpack --global

echo '{                                    
  "presets" : ["es2015", "react"]    
}' > .babelrc

echo "
const path = require('path');
 
module.exports = {
  entry: './app/index.js',
  output: {
    path: path.resolve('dist'),
    filename: 'index_bundle.js'
  },
  module: {
    rules: [
      { test: /\.js$/, loader: 'babel-loader', exclude: /node_modules/ }
    ]
  }
} " > webpack.config.js

mkdir app
cd app
echo "
import React from 'react';
import ReactDOM from 'react-dom';
 
class HelloWorld extends React.Component {
    render() {
          return (
                  <div>
                    Hello, React!
                  </div>
                )
        }
};
 
ReactDOM.render(<HelloWorld />, document.getElementById('root'));
" > index.js

cd ..

echo '
<html>
  <div id="root"></div>
  <script src="./dist/index_bundle.js"></script>
</html>
' > index.html


echo ' run webpack --mode=development to build index_bundle.js '
echo ' visit index.html '
