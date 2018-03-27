const { environment } = require('@rails/webpacker')

// resolve-url-loader must be used before sass-loader


environment.loaders.get('sass').use.splice(-1, 0, {

loader: 'resolve-url-loader'

})


environment.loaders.append('style', {
test: /\.(scss|sass|css)$/,
use: [{
loader: "to-string-loader"
}, {
loader: "css-loader"
},  {
loader: "sass-loader"
}]
})



environment.loaders.append('ts',{test: /\.ts$/,
								use: 'ts-loader'})
environment.loaders.append('js',{test: /\.js$/,
								use: 'babel-loader', exclude: /node_modules/})
environment.loaders.append('html', {
test: /\.html$/,
exclude: /node_modules/,
loaders: ['html-loader'] 
})



module.exports = environment
