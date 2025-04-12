// AboutPage.ets
import router from '@ohos.router';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct AboutPage {
  @State appVersion: string = '1.0.0' // 当前版本
  private companyInfo: string = '惠农科技有限公司'
  private icpNumber: string = '豫ICP备12345678号-1'

  build() {
    Column() {
      // 顶部应用信息
      Column() {
        Image($r('app.media.startIcon'))
          .width(80)
          .height(80)
          .margin({ bottom: 12 })

        Text('惠农')
          .fontSize(24)
          .fontColor(Color.Black)

        Text('助力智慧农田')
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)

      // 信息列表
      List() {
        // 软件介绍
        ListItem() {
          SettingItem({
            icon: $r('app.media.ic_info'),
            title: '软件介绍',
            content: '一款服务于智慧农田的一站式...',
            hasArrow: true
          })
        }
        .onClick(() => router.pushUrl({ url: 'pages/IntroPage' }))

        // 版本信息
        ListItem() {
          SettingItem({
            icon: $r('app.media.ic_update'),
            title: '当前版本',
            content: this.appVersion,
            hasButton: true,
            buttonText: '检查更新'
          })
        }
        .onClick(() => this.checkUpdate())

        // 开发团队
        ListItem() {
          SettingItem({
            icon: $r('app.media.ic_team'),
            title: '开发团队',
            content: this.companyInfo,
            hasArrow: true
          })
        }
        .onClick(() => router.pushUrl({ url: 'pages/TeamPage' }))

        // 服务协议
        ListItem() {
          SettingItem({
            icon: $r('app.media.ic_document'),
            title: '用户协议',
            content: '查看服务条款',
            hasArrow: true
          })
        }
        .onClick(() => router.pushUrl({ url: 'pages/TermsPage' }))
      }
      .divider({ strokeWidth: 1, color: '#F0F0F0' })
      .scrollBar(BarState.Off)
      .flexGrow(1)

      // 备案信息
      Column() {
        Text(this.icpNumber)
          .fontSize(12)
          .fontColor('#999')

        Text('Copyright © 2025 HuiNong Tech')
          .fontSize(12)
          .fontColor('#999')
          .margin({ top: 8 })
      }
      .padding(20)
    }
    .backgroundColor('#F5F5F5')
    .height('100%')
  }

  // 检查更新逻辑
  private checkUpdate() {
    // 实际开发中调用更新接口
    promptAction.showToast({
      message:'已是最新版本'
    })
  }
}

// 可复用的信息项组件
@Component
struct SettingItem {
  private icon: Resource = $r('app.media.ic_default')
  private title: string = ''
  private content: string = ''
  private hasArrow: boolean = false
  private hasButton: boolean = false
  private buttonText: string = ''

  build() {
    Row() {
      // 图标
      Image(this.icon)
        .width(24)
        .height(24)
        .margin({ right: 16 })

      // 文字内容
      Column() {
        Text(this.title)
          .fontSize(16)
          .fontColor(Color.Black)

        if (this.content) {
          Text(this.content)
            .fontSize(14)
            .fontColor('#666')
            .margin({ top: 4 })
        }
      }
      .layoutWeight(1)

      // 右侧控件
      if (this.hasButton) {
        Button(this.buttonText)
          .fontSize(14)
          .padding({ left: 12, right: 12 })
      } else if (this.hasArrow) {
        Image($r('app.media.right_grey'))
          .width(20)
          .height(20)
      }
    }
    .padding(16)
    .width('100%')
  }
}