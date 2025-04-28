import ItemData from "../../viewmodel/ItemData"
import MainViewModel from "../../viewmodel/MainViewModel"
import { router } from "@kit.ArkUI";
import promptAction from '@ohos.promptAction';
/*
 * 我的界面
 * */
@Preview
@Component
export default struct Setting {
  handleClick(id: number){
    switch (id){
      case 1:
        router.pushUrl({url: 'pages/Settings/FontSizesetting'})
        break;
      case 2:
        router.pushUrl({url: 'pages/Settings/MenuSetting'})
        break;
      case 3:
        promptAction.showToast({
          message:'已清理缓存200MB'
        })
        break;
      case 4:
        router.pushUrl({url: 'pages/PrivacyPolicy/PrivacyPolicy'})
        break;
      case 5:
        router.pushUrl({url: 'pages/Settings/About'})
    }//这里对应的是我的界面的功能列表，目前只有五个，而且二级界面只有基础组件，不够美观
  }
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
  }//这个是每个功能对应的格式

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
                .onClick(() =>{
                  this.handleClick(cell.id)
                })
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
        }//通过List来创建功能列表
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
        .onClick(() => {
          router.replaceUrl({ url: 'pages/UserLoginPage'});//点击退出登录按钮之后普退回到登录界面，且不可退回
        })
    }
    .backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')

  }
}