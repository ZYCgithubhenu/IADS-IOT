import MyTabs from './Tabs/MyTabs';
import FirstTabs from './Tabs/FirstTabs';


@Builder
export function IndexBuilder() {
    Index()
}
@Entry
@Component
export struct Index {
  //@provide 装饰器和@consume装饰器，与后代组件双向同步
  @Provide currentIndex: number = 0;
  @Provide isPageShow : boolean = true;
  @StorageLink('bottomHeight') bottomHeight: number = 0;


  //自定义选项卡(tabs)导航栏样式
  @Builder
  TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .width(20)
        .aspectRatio(1)
      Text(title)
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.brand') : $r('app.color.font'))
        .margin({ top: 4 })
    }
    .width('100%')
    .height(56)
    .border({ width: { top: 1 }, color: '#eee' })
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
    })
  }


  build() {
      Tabs({ index: this.currentIndex, barPosition: BarPosition.End }) {
        TabContent() {
          FirstTabs();
        }
        .tabBar(this.TabBuilder('首页', 0, $r("app.media.shouye_select"), $r('app.media.shouye_filled')))

        TabContent() {
          MyTabs();
        }
        .tabBar(this.TabBuilder('我的', 1, $r('app.media.wode_select'), $r('app.media.wode_filled')))
      }
      .barMode(BarMode.Fixed) // 默认值 Fixed
      .scrollable(false) // 限制滑动
      .padding({ bottom: this.bottomHeight })
    }
}

