// FontSizeSettingPage.ets

import preferences from '@ohos.data.preferences';
import { FontSizeManager } from '../../viewmodel/FontSizeManager';
/*
 * 字体大小设置界面
 * */
@Entry
@Component
struct FontSizeSettingPage {
  @State currentScale: number = 1.0
  private previewText: string = "这是一段预览文字，用于展示字体大小调整效果"

  // 初始化加载保存的设置
  aboutToAppear() {
    this.loadSavedScale()
  }

  build() {
    Column() {
      // 标题
      Text('字体大小设置')
        .fontSize(24)
        .margin({ top: 20, bottom: 30 })

      // 预览区域
      Column() {
        Text(this.previewText)
          .fontSize(16 * this.currentScale)
          .textAlign(TextAlign.Center)
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(12)
          .shadow({ radius: 8, color: '#10000000' })
          .width('90%')
      }
      .margin({ bottom: 30 })

      // 调节滑块
      Slider({
        value: this.currentScale,
        min: 0.8,
        max: 1.5,
        step: 0.1
      })
        .blockColor(Color.Blue)
        .trackThickness(8)
        .onChange((value: number) => {
          this.updateScale(value)
        })
        .width('90%')
        .margin({ bottom: 20 })

      // 预设按钮
      Row() {
        Button('小')
          .fontSize(16)
          .padding(10)
          .backgroundColor(this.currentScale === 0.8 ? Color.Blue : Color.Black)
          .onClick(() => this.updateScale(0.8))

        Button('标准')
          .fontSize(16)
          .padding(10)
          .backgroundColor(this.currentScale === 1.0 ? Color.Blue : Color.Black)
          .margin({ left: 15, right: 15 })
          .onClick(() => this.updateScale(1.0))

        Button('大')
          .fontSize(16)
          .padding(10)
          .backgroundColor(this.currentScale === 1.2 ? Color.Blue : Color.Black)
          .onClick(() => this.updateScale(1.2))
      }
      .margin({ bottom: 30 })

      // 说明文字
      Text('拖动滑块或点击按钮调整字体大小')
        .fontSize(14)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .alignItems(HorizontalAlign.Center)
  }

  // 更新字体比例
  private updateScale(scale: number) {
    this.currentScale = Math.min(Math.max(scale, 0.8), 1.5)
    FontSizeManager.getInstance().setScale(this.currentScale)
    this.saveScale()
  }

  // 保存设置到本地
  private async saveScale() {
    try {
      const prefs = await preferences.getPreferences(getContext(this), 'fontSettings')
      await prefs.put('fontScale', this.currentScale)
      await prefs.flush()
    } catch (err) {
      console.error(`保存设置失败: ${err}`)
    }
  }

  // 加载保存的设置
  private async loadSavedScale() {
    try {
      const prefs = await preferences.getPreferences(getContext(this), 'fontSettings')
      const savedScale = await prefs.get('fontScale', 1.0)
      this.currentScale = savedScale as number
    } catch (err) {
      console.error(`加载设置失败: ${err}`)
    }
  }
}