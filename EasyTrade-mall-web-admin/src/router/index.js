import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '../views/layout/Layout'

/**
 * hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
 *                                if not set alwaysShow, only more than one route under the children
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noredirect           if `redirect:noredirect` will no redirct in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
  }
 **/
export const constantRouterMap = [
  {path: '/login', component: () => import('@/views/login/index'), hidden: true},
  {path: '/404', component: () => import('@/views/404'), hidden: true},
  {
    path: '',
    component: Layout,
    redirect: '/home',
    children: [{
      path: 'home',
      name: 'home',
      component: () => import('@/views/home/index'),
      meta: {title: 'Home', icon: 'home'}
    }]
  }
]

export const asyncRouterMap = [
  {
    path: '/pms',
    component: Layout,
    redirect: '/pms/product',
    name: 'pms',
    meta: {title: 'Product', icon: 'product'},
    children: [{
      path: 'product',
      name: 'product',
      //component: () => import('@/views/bak/pms/product/index'),
      meta: {title: 'Product List', icon: 'product-list'}
    },
      {
        path: 'addProduct',
        name: 'addProduct',
        //component: () => import('@/views/bak/pms/product/add'),
        meta: {title: 'Add Product', icon: 'product-add'}
      },
      {
        path: 'updateProduct',
        name: 'updateProduct',
        //component: () => import('@/views/bak/pms/product/update'),
        meta: {title: 'Edit Product', icon: 'product-add'},
        hidden: true
      },
      {
        path: 'productCate',
        name: 'productCate',
        //component: () => import('@/views/bak/pms/productCate/index'),
        meta: {title: 'Product Categories', icon: 'product-cate'}
      },
      {
        path: 'addProductCate',
        name: 'addProductCate',
        //component: () => import('@/views/bak/pms/productCate/add'),
        meta: {title: 'Add Product Category'},
        hidden: true
      },
      {
        path: 'updateProductCate',
        name: 'updateProductCate',
        //component: () => import('@/views/bak/pms/productCate/update'),
        meta: {title: 'Edit Product Category'},
        hidden: true
      },
      {
        path: 'productAttr',
        name: 'productAttr',
        //component: () => import('@/views/bak/pms/productAttr/index'),
        meta: {title: 'Product Category', icon: 'product-attr'}
      },
      {
        path: 'productAttrList',
        name: 'productAttrList',
       // component: () => import('@/views/bak/pms/productAttr/productAttrList'),
        meta: {title: 'Product Attribute List'},
        hidden: true
      },
      {
        path: 'addProductAttr',
        name: 'addProductAttr',
        //component: () => import('@/views/bak/pms/productAttr/addProductAttr'),
        meta: {title: 'Add Product Attribute'},
        hidden: true
      },
      {
        path: 'updateProductAttr',
        name: 'updateProductAttr',
        //component: () => import('@/views/bak/pms/productAttr/updateProductAttr'),
        meta: {title: 'Edit Product Attribute'},
        hidden: true
      },
      {
        path: 'brand',
        name: 'brand',
        //component: () => import('@/views/bak/pms/brand/index'),
        meta: {title: 'Brands', icon: 'product-brand'}
      },
      {
        path: 'addBrand',
        name: 'addBrand',
        //component: () => import('@/views/bak/pms/brand/add'),
        meta: {title: 'Add Brand'},
        hidden: true
      },
      {
        path: 'updateBrand',
        name: 'updateBrand',
        //component: () => import('@/views/bak/pms/brand/update'),
        meta: {title: 'Edit Brand'},
        hidden: true
      }
    ]
  },
  {
    path: '/oms',
    component: Layout,
    redirect: '/oms/order',
    name: 'oms',
    meta: {title: 'Order', icon: 'order'},
    children: [
      {
        path: 'order',
        name: 'order',
        //component: () => import('@/views/bak/oms/order/index'),
        meta: {title: 'Order List', icon: 'product-list'}
      },
      {
        path: 'orderDetail',
        name: 'orderDetail',
        //component: () => import('@/views/bak/oms/order/orderDetail'),
        meta: {title: 'Order Details'},
        hidden:true
      },
      {
        path: 'deliverOrderList',
        name: 'deliverOrderList',
        //component: () => import('@/views/bak/oms/order/deliverOrderList'),
        meta: {title: 'Shipped Orders'},
        hidden:true
      },
      {
        path: 'orderSetting',
        name: 'orderSetting',
        //component: () => import('@/views/bak/oms/order/setting'),
        meta: {title: 'Order Setting', icon: 'order-setting'}
      },
      {
        path: 'returnApply',
        name: 'returnApply',
        //component: () => import('@/views/bak/oms/apply/index'),
        meta: {title: 'Order Return', icon: 'order-return'}
      },
      {
        path: 'returnReason',
        name: 'returnReason',
        //component: () => import('@/views/bak/oms/apply/reason'),
        meta: {title: 'Return Reason', icon: 'order-return-reason'}
      },
      {
        path: 'returnApplyDetail',
        name: 'returnApplyDetail',
        //component: () => import('@/views/bak/oms/apply/applyDetail'),
        meta: {title: 'Return Reason Details'},
        hidden:true
      }
    ]
  },
  // {
  //   path:'/sms',
  //   component: Layout,
  //   redirect: '/sms/coupon',
  //   name: 'sms',
  //   meta: {title: '营销', icon: 'sms'},
  //   children: [
  //     {
  //       path: 'flash',
  //       name: 'flash',
  //       component: () => import('@/views/sms/flash/index'),
  //       meta: {title: '秒杀活动列表', icon: 'sms-flash'}
  //     },
  //     {
  //       path: 'flashSession',
  //       name: 'flashSession',
  //       component: () => import('@/views/sms/flash/sessionList'),
  //       meta: {title: '秒杀时间段列表'},
  //       hidden:true
  //     },
  //     {
  //       path: 'selectSession',
  //       name: 'selectSession',
  //       component: () => import('@/views/sms/flash/selectSessionList'),
  //       meta: {title: '秒杀时间段选择'},
  //       hidden:true
  //     },
  //     {
  //       path: 'flashProductRelation',
  //       name: 'flashProductRelation',
  //       component: () => import('@/views/sms/flash/productRelationList'),
  //       meta: {title: '秒杀商品列表'},
  //       hidden:true
  //     },
  //     {
  //       path: 'coupon',
  //       name: 'coupon',
  //       component: () => import('@/views/sms/coupon/index'),
  //       meta: {title: '优惠券列表', icon: 'sms-coupon'}
  //     },
  //     {
  //       path: 'addCoupon',
  //       name: 'addCoupon',
  //       component: () => import('@/views/sms/coupon/add'),
  //       meta: {title: '添加优惠券'},
  //       hidden:true
  //     },
  //     {
  //       path: 'updateCoupon',
  //       name: 'updateCoupon',
  //       component: () => import('@/views/sms/coupon/update'),
  //       meta: {title: '修改优惠券'},
  //       hidden:true
  //     },
  //     {
  //       path: 'couponHistory',
  //       name: 'couponHistory',
  //       component: () => import('@/views/sms/coupon/history'),
  //       meta: {title: '优惠券领取详情'},
  //       hidden:true
  //     },
  //     {
  //       path: 'brand',
  //       name: 'homeBrand',
  //       component: () => import('@/views/sms/brand/index'),
  //       meta: {title: '品牌推荐', icon: 'product-brand'}
  //     },
  //     {
  //       path: 'new',
  //       name: 'homeNew',
  //       component: () => import('@/views/sms/new/index'),
  //       meta: {title: '新品推荐', icon: 'sms-new'}
  //     },
  //     {
  //       path: 'hot',
  //       name: 'homeHot',
  //       component: () => import('@/views/sms/hot/index'),
  //       meta: {title: '人气推荐', icon: 'sms-hot'}
  //     },
  //     {
  //       path: 'subject',
  //       name: 'homeSubject',
  //       component: () => import('@/views/sms/subject/index'),
  //       meta: {title: '专题推荐', icon: 'sms-subject'}
  //     },
  //     {
  //       path: 'advertise',
  //       name: 'homeAdvertise',
  //       component: () => import('@/views/sms/advertise/index'),
  //       meta: {title: '广告列表', icon: 'sms-ad'}
  //     },
  //     {
  //       path: 'addAdvertise',
  //       name: 'addHomeAdvertise',
  //       component: () => import('@/views/sms/advertise/add'),
  //       meta: {title: '添加广告'},
  //       hidden:true
  //     },
  //     {
  //       path: 'updateAdvertise',
  //       name: 'updateHomeAdvertise',
  //       component: () => import('@/views/sms/advertise/update'),
  //       meta: {title: '编辑广告'},
  //       hidden:true
  //     }
  //   ]
  // },
  {
    path:'/ums',
    component: Layout,
    redirect: '/ums/admin',
    name: 'ums',
    meta: {title: 'Authority', icon: 'ums'},
    children: [
      {
        path: 'admin',
        name: 'admin',
        component: () => import('@/views/ums/admin/index'),
        meta: {title: 'Users', icon: 'ums-admin'}
      },
      {
        path: 'role',
        name: 'role',
        component: () => import('@/views/ums/role/index'),
        meta: {title: 'Characters', icon: 'ums-role'}
      },
      {
        path: 'allocMenu',
        name: 'allocMenu',
        component: () => import('@/views/ums/role/allocMenu'),
        meta: {title: 'Menu Allocation'},
        hidden: true
      },
      {
        path: 'allocResource',
        name: 'allocResource',
        component: () => import('@/views/ums/role/allocResource'),
        meta: {title: 'Resource Allocation'},
        hidden: true
      },
      {
        path: 'menu',
        name: 'menu',
        component: () => import('@/views/ums/menu/index'),
        meta: {title: 'Menu List', icon: 'ums-menu'}
      },
      {
        path: 'addMenu',
        name: 'addMenu',
        component: () => import('@/views/ums/menu/add'),
        meta: {title: 'Add Menu'},
        hidden: true
      },
      {
        path: 'updateMenu',
        name: 'updateMenu',
        component: () => import('@/views/ums/menu/update'),
        meta: {title: 'Edit Menu'},
        hidden: true
      },
      {
        path: 'resource',
        name: 'resource',
        component: () => import('@/views/ums/resource/index'),
        meta: {title: 'Resource List', icon: 'ums-resource'}
      },
      {
        path: 'resourceCategory',
        name: 'resourceCategory',
        component: () => import('@/views/ums/resource/categoryList'),
        meta: {title: 'Resource Category'},
        hidden: true
      }
    ]
  },
  {path: '*', redirect: '/404', hidden: true}
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({y: 0}),
  routes: constantRouterMap
})

