<template>
  <div class="menu-banner">
    <div class="menu-container">
      <ul class="menu-list">
        <li class="list-item" v-for="(item, index) in menus" :key="index">
          <a :href="item.url" target="blank">{{ item.value }}</a>
          <i class="fa fa-angle-right"></i>
        </li>
      </ul>
    </div>
    <banner :banners="banners"></banner>
  </div>
</template>

<script>
import Banner from './Banner'

export default {
  data() {
    return {
      // bannerMenuFlag: false,
      // menuTimer: '',
      // listInfoData: [],
      menus: [
        { value: 'Notable Collections', url: '', type: 'notable' },
        { value: 'Top Today', url: '', type: 'top' },
        { value: 'Spotlight Creators', url: '', type: 'spolight' },
        { value: 'Art', url: '', type: 'art' },
        { value: 'Gaming', url: '', type: 'gaming' },
        { value: 'Memberships', url: '', type: 'memberships' },
        { value: 'PFPs', url: '', type: 'pfp' },
        { value: 'Photography', url: '', type: 'photography' },
        { value: 'Explore', url: '', type: 'explore' }
      ],
      banners: [
        { src: 'https://i.seadn.io/gae/29bwfFiSOghF1Xz4qSlpNUzhbifm9Xi-LPxoLWG3CNHi4JNjr3p82mC8oRsvB5UNahSRwsRR4PWbOJtuEbHYPar5X4vVr0iOCNZU?auto=format&w=3840', url: '' },
        { src: 'https://i.seadn.io/gae/nzHazAiTkgDTCDTT4C7syt0stXjvZTTLBZigWiuHab-gYo5mu4VDLfu60wxtlfTE-QGknzf2ZYSAuj8ZlrnS8KzfMjd77db83a0AwBk?auto=format&w=3840', url: '' },
        { src: 'https://i.seadn.io/gae/VML7qVZ2ndkEkixayEbVJK9-az5D0Ty7eX8KeRm4Zath5RIiCISGvMFGCbVOF59z3RiEX6pTIst2UzKoo98Gt-TU7KAnm9RIe6o-?auto=format&w=3840', url: '' },
        { src: 'https://i.seadn.io/gae/kR2vaTkmu8XQaLke3GPt6SSB-1wlNI5nK4l4GDAIFEXe1m-98PWmDu5Oh0LuRKC88tNoEB_zI2gMddG8vhD9cjNZGO8fGwkeW9Mu?auto=format&w=3840', url: '' },
        { src: 'https://i.seadn.io/gcs/files/5e4f9377fd635e426326d74215f344a9.jpg?auto=format&w=3840', url: '' }
      ]
    }
  },
  methods: {

  },
  computed: {

  },
  components: {
    'Banner': Banner
  }
}
</script>

<style lang="less">
.menu-banner {
  position: relative;
  width: 1226px;
  height: auto;
  margin: 0 auto;

  .menu-container {
    position: absolute;
    left: 0;
    top: 0;
    width: 235px;
    height: auto;
    background: rgba(0, 0, 0, 0.3);
    z-index: 10;
  }
}

.menu-list {
  padding: 20px 0;
  height: 420px;

  .list-item {
    display: flex;
    padding-left: 30px;

    &:hover {
      background-color: #00ccff;
    }

    a {
      position: relative;
      display: inline-block;
      width: 170px;
      height: 42px;
      line-height: 42px;
      color: #fff;
      text-align: left;
      background-color: transparent;
    }

    i {
      font-size: 22px;
      color: #e0e0e0;
      line-height: 42px;
    }
  }
}
</style>