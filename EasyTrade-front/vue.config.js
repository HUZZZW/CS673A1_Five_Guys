module.exports = {
  devServer:{  
    disableHostCheck: true,
    host:'localhost',
    port:8082, 
  },
  productionSourceMap:true,
  chainWebpack:(config)=>{
    config.plugins.delete('prefetch');
  }
}