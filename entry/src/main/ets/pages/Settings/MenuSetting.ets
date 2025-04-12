import router from '@ohos.router';
import preferences from '@ohos.data.preferences';

@Entry
@Component
struct MenuSetting {
  // 状态管理
  @State isDarkMode: boolean = false
  @State notificationEnabled: boolean = true
  @State wifiEnabled: boolean = false
  @Builder
  BuildGroupHeader(title: string) {
    Text(title)
      .fontSize(16)
      .fontColor('#666')
      .margin({ left: 24, top: 16, bottom: 8 })
  }

  build() {
    List() {
      // 用户信息头
      ListItem() {
        Row() {
          Image($r('app.media.Account_img'))
            .width(40)
            .height(40)
            .margin({ right: 15 })

          Column() {
            Text("用户昵称")
              .fontSize(18)
              .fontColor(Color.Black)
            Text("账号管理 >")
              .fontSize(14)
              .fontColor(Color.Gray)
          }
          .alignItems(HorizontalAlign.Start)
        }
        .padding(15)
      }
      .onClick(() => {
        router.pushUrl({ url: 'pages/AccountPage' })
      })

      // 常规设置分组
      ListItemGroup({ header:this.BuildGroupHeader("常规设置") }) {
        // 主题设置
        this.BuildSettingItem(
          $r('app.media.theme'),
          "主题模式",
          this.isDarkMode ? "深色" : "浅色",
          true,
          () => {
            this.isDarkMode = !this.isDarkMode
            this.saveSetting('themeMode', this.isDarkMode)
          }
        )
      }


      // 系统设置分组
      ListItemGroup({ header:this.BuildGroupHeader("系统设置") }) {
        this.BuildSettingItem(
          $r('app.media.ic_storage'),
          "存储管理",
          "12.4GB/128GB",
          true
        )

        this.BuildSettingItem(
          $r('app.media.ic_update'),
          "系统更新",
          "最新版本",
          true
        )
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF')
  }

  // 通用设置项构建方法
  @Builder
  BuildSettingItem(
    icon: Resource,
    title: string,
    subtitle: string = "",
    showArrow: boolean = false,
    onClick?: () => void,
    switchValue: boolean = false,
    onSwitchChange?: (value: boolean) => void
  ) {
    ListItem() {
      Row() {
        // 图标
        Image(icon)
          .width(24)
          .height(24)
          .margin({ right: 15 })

        // 文字区域
        Column() {
          Text(title)
            .fontSize(16)
            .fontColor(Color.Black)
          if (subtitle) {
            Text(subtitle)
              .fontSize(12)
              .fontColor(Color.Gray)
          }
        }
        .layoutWeight(1)

        // 右侧控件
        if (onSwitchChange) {
          Toggle({ type: ToggleType.Switch, isOn: switchValue })
            .onChange((value) => {
              onSwitchChange(value)
            })
        } else if (showArrow) {
          Image($r('app.media.right_grey'))
            .width(20)
            .height(20)
        }
      }
      .padding(15)
      .width('100%')
    }
    .onClick(() => {
      if (onClick) {
        onClick()
      }
    })
    Divider().strokeWidth(1).color("#F0F0F0")
  }

  // 保存设置到本地
  private async saveSetting(key: string, value: boolean) {
    try {
      const prefs = await preferences.getPreferences(getContext(this), 'appSettings')
      await prefs.put(key, value)
      await prefs.flush()
    } catch (err) {
      console.error(`保存设置失败: ${err}`)
    }
  }
}