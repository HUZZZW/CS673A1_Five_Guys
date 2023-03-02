<template>
  <div class="goods-sale">
    <poster :postItem="postItem1"></poster>
    <goods-box :goodsItem="goodsItem1"></goods-box> 
  </div>
</template>

<script>
import Poster from './Poster'
import GoodsBox from './GoodsBox'

export default {
  data () {
    return {
      postItem1: {src: 'https://i.seadn.io/gae/bouz6-ne8tLkMOkfazWvWW6xk35h3RTstNvtekNT2HqUx57zc_nz9eaPiqSJySEPypl8Vfo9VmO4tmtflrZrOI7I-tMhBy1MTLkqlA?auto=format&w=3840', url: ''},
     
      goodsItem1: {
        boxTitle: 'Trending Art',
        //isHot: false,
        //vertical: true,
        //url: '',
        listData: {
          goods: [
            {value: 'MechMindsAI', desc: 'AI x Blockchain with <8192 deflationary NFT robots.', sub: true, newPrice: '1399', oldPrice: '', src: 'https://i.seadn.io/gcs/files/3d5365caab0a25b656daa3bfceecadb6.jpg?auto=format&w=256', url: ''},
            {value: 'Modern Muse', desc: 'Marilyn Monroe x Zeblocks Mint Pass', sub: true, newPrice: '999', oldPrice: '', src: 'https://i.seadn.io/gcs/files/0471c231435a627fe8e6879ef03cc40d.jpg?auto=format&w=500&h=500', url: ''},
            {value: 'Chainspace.app', desc: 'An experimental art project with no promises', sub: false, newPrice: '2299', oldPrice: '2599', src: 'https://i.seadn.io/gcs/files/eb54c16c7f9a40858e9f15d982fc0154.png?auto=format&w=500&h=500', url: ''},
            {value: 'Blockalizer: Chroma', desc: 'The Chroma collection is expanding collection.', sub: false, newPrice: '1099', oldPrice: '1399', src: 'https://i.seadn.io/gcs/files/9667c315d416a89ea0f5ac3d9991e93c.png?auto=format&w=500&h=500', url: ''},
            {value: 'Schrödinger Circuits', desc: 'Art inspired by science & infused with game theory', sub: true, newPrice: '699', oldPrice: '799', src: 'https://i.seadn.io/gcs/files/787f9ab84cb929ff6901cf4baabc332f.png?auto=format&w=500&h=500', url: ''},
            {value: 'Toys by 0xTechno', desc: 'Toys is the genesis generative art collection by 0xTechno', sub: false, newPrice: '2599', oldPrice: '3599', src: 'https://i.seadn.io/gcs/files/163db6e9221c2ffb829a88518068e06a.png?auto=format&w=500&h=500', url: ''}
          ]
        }
      }, 
    }
  },
  components: {
    'Poster': Poster,
    'GoodsBox': GoodsBox
  }
}
</script>

<style lang="less">
  .goods-sale {
      position: relative;
      
    text-align: center;
      width: 1226px;
      height: auto;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
  }
  .goods-sale *{    box-sizing: border-box;}
</style>