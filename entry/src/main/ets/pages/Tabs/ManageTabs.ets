import ItemData from "../../viewmodel/ItemData"
import MainViewModel from "../../viewmodel/MainViewModel"
import { router } from "@kit.ArkUI"

@Preview
@Component
export default struct ManageTabs {
  private getTargetPage(id: number): string {
    const pageMap = new Map<number, string>([
      [0, 'pages/Utils/EnvirMonitor'],
      [1, 'pages/Utils/GreenHouse'],
      [2,'pages/Utils/Crop'],
      [3,'pages/Utils/Weather']
    ]);
    return pageMap.get(id) || 'pages/DefaultPage';
  }

  build() {
    Column(){
      Text('管理')
        .width('100%')
        .margin({
          top: '20vp',
          bottom: '12vp',
          left:'16vp'
        })
        .fontWeight(700)
        .fontSize('28fp')
      Grid() {
        ForEach(MainViewModel.getManageData(), (item: ItemData, index: number) => {
          GridItem() {
            Column() {
              Image(item.img)
                .width('100vp')
                .height('80vp')
              Text(item.title)
                .fontSize('24fp')
                .margin({ top: '10vp' })
            }
            .onClick(() => {
              router.pushUrl({url:this.getTargetPage(item.id)})
            })
          }
          .margin({top:12})
        }, (item: ItemData) => JSON.stringify(item))//生成唯一键
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap('8vp')
      .rowsGap('12vp')
      .backgroundImageSize({
        width: '100%',
        height: '100%'
      })
      .margin({ top: '12vp' })
      .padding({
        top: '12vp',
        bottom: '12vp',
      })
      .height('60%')
      .backgroundColor(Color.White)
      .borderRadius('16fp')
    }
    .height('100%')
    .width('100%')
  }
}