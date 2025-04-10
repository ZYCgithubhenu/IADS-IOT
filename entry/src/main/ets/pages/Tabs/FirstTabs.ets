import ItemData from "../../viewmodel/ItemData"
import MainViewModel from "../../viewmodel/MainViewModel"

@Preview
@Component
export default struct FirstTabs {
  build() {
    Column() {
      Text('首页')
        .width('100%')
        .margin({
          top: '20vp',
          bottom: '12vp',
          left:'16vp'
        })
        .fontWeight(700)
        .fontSize('28fp')
      Swiper() {
        ForEach(MainViewModel.getSwiperImages(), (img: Resource) => {
          Image(img)
            .width('100%')
            .borderRadius('16vp')
        }, (img: Resource) => JSON.stringify(img.id))
      }
      .autoPlay(true)
      Grid() {
        ForEach(MainViewModel.getFirstGridData(), (item: ItemData, index: number) => {
          GridItem() {
            Column() {
              Image(item.img)
                .width('40vp')
                .height('40vp')
              Text(item.title)
                .fontSize('12fp')
                .margin({ top: '4vp' })
            }
          }
        }, (item: ItemData) => JSON.stringify(item))
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr')
      .columnsGap('8vp')
      .rowsGap('12vp')
      .backgroundImageSize({
        width: '100%',
        height: '156vp'
      })
      .margin({ top: '12vp' })
      .padding({
        top: '12vp',
        bottom: '12vp'
      })
      .height('156vp')
      .backgroundColor(Color.White)
      .borderRadius('16fp')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
