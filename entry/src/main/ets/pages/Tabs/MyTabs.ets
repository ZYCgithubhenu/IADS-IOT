import ItemData from "../../viewmodel/ItemData"
import MainViewModel from "../../viewmodel/MainViewModel"


@Preview
@Component
export default struct Setting {
  @Builder
  settingCell(item: ItemData) {
    Row() {
      Row({}) {
        Image(item.img)
          .height('22vp')
          .margin({
            left: '16vp',
            right: '12vp'
          })
        Text(item.title)
          .fontSize('16fp')
      }

      if (item.others === undefined) {
        Image($r('app.media.right_grey'))
          .width('12vp')
          .height('24vp')
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: '8vp',
      right: '22vp'
    })
  }

  build() {
    Column() {
      Text('我的')
        .width('100%')
        .margin({
          top: '20vp',
          bottom: '12vp',
          left:'16vp'
        })
        .fontWeight(700)
        .fontSize('28fp')
      Row() {
        Image($r('app.media.Account_img'))
          .width('48vp')
          .height('48vp')
          .margin({ left: '12vp' })
        Column() {
          Text('用户名称')
            .fontSize('20fp')
          Text('2000000@test.cc')
            .fontSize('12fp')
            .margin({ top: '4vp' })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: '12vp' })
      }
      .alignItems(VerticalAlign.Center)
      .width('100%')

      List({ space: '12vp' }) {
        ForEach(MainViewModel.getSettingListData(), (item: ItemData[]) => {
          ListItemGroup() {
            ForEach(item, (cell: ItemData) => {
              ListItem() {
                this.settingCell(cell)
              }
              .height('48vp')
            })
          }
          .divider({
            strokeWidth: '1vp',
            color: '#0d000000',
            startMargin: '42vp',
            endMargin: '24vp'
          })
          .backgroundColor('#ffffff')
          .borderRadius('16vp')
        }, (item: ItemData) => JSON.stringify(item))
      }
      .scrollBar(BarState.Off)
      .width('100%')
      .padding({
        top: '4vp',
        bottom: '4vp'
      })
      Blank();
      Button('退出登录', { type: ButtonType.Capsule })
        .width('90%')
        .height('40vp')
        .fontSize('16fp')
        .fontColor('#FA2A2D')
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#E5E8EA')
        .margin({ bottom: '16vp' })
    }
    .backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')

  }
}