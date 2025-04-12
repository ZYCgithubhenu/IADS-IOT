import ItemData from './ItemData';
export class MainViewModel {
  //首页轮播图
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.fig1'),
      $r('app.media.fig2'),
      $r('app.media.fig3'),
      $r('app.media.fig4')
    ];
    return swiperImages;
  }
  //首页宫格
  getFirstGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData(0, '农田状态', $r('app.media.nongtian')),
      new ItemData(1, '设备管理', $r('app.media.shebeiguanli')),
      new ItemData(2, '预警', $r('app.media.yujing'))
      // new ItemData(3, '购物车', $r('app.media.shopping')),
      // new ItemData(4, '我的目标', $r('app.media.target')),
      // new ItemData(5, '圈子', $r('app.media.circle')),
      // new ItemData(6, '收藏', $r('app.media.favorite')),
      // new ItemData(7, '回收站', $r('app.media.recycle'))
    ];
    return firstGridData;
  }
  //我的设置页列表
  getSettingListData(): Array<Array<ItemData>> {
    let settingListData: ItemData[][] = [
      [
        new ItemData(0, '推送通知', $r('app.media.news'), '切换按钮'),
      ],
      [
        new ItemData(1, '字体大小调节', $r('app.media.fontsize_png')),
        new ItemData(2, '菜单设置', $r('app.media.menu')),
      ],
      [
        new ItemData(3, '清除缓存', $r('app.media.storage')),
        new ItemData(4, '隐私协议', $r('app.media.PrivacyPolicy')),
      ],
      [
        new ItemData(5, '关于', $r('app.media.about'))
      ]
    ];
    return settingListData;
  }
}

export default new MainViewModel();