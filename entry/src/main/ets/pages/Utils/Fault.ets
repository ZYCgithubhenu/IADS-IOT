@Entry
@Component
struct WarningInterface {
  // 设备运行状态，true 表示正常，false 表示异常
  deviceStatus: boolean = false
  // 农田数据状态，true 表示正常，false 表示异常
  farmDataStatus: boolean = true
  // 天气情况状态，true 表示正常，false 表示异常
  weatherStatus: boolean = false

  build() {
    Column({ space: 20 }) {
      // 标题
      Text('智慧农田状态监测')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // 状态显示区域
      Row({ space: 40 }) {
        // 设备运行状态
        Column({ space: 10 }) {
          Stack({ alignContent: Alignment.Center }) {
            Image('$r(media.device_icon)')
              .width(80)
              .height(80)
            if (!this.deviceStatus) {
              Circle()
                .width(20)
                .height(20)
                .backgroundColor('#FF0000')
                //.alignSelf(Alignment.TopEnd)
                .margin({ right: -5, top: -5 })
            }
          }
          Text('设备运行状态')
            .fontSize(16)
          if (!this.deviceStatus) {
            Text('异常！请检查设备')
              .fontSize(14)
              .fontColor('#FF0000')
          } else {
            Text('正常')
              .fontSize(14)
              .fontColor('#008000')
          }
        }

        // 农田数据状态
        Column({ space: 10 }) {
          Stack({ alignContent: Alignment.Center }) {
            Image('$r(media.farm_data_icon)')
              .width(80)
              .height(80)
            if (!this.farmDataStatus) {
              Circle()
                .width(20)
                .height(20)
                .backgroundColor('#FF0000')
                //.alignSelf(Alignment.TopEnd)
                .margin({ right: -5, top: -5 })
            }
          }
          Text('农田数据状态')
            .fontSize(16)
          if (!this.farmDataStatus) {
            Text('异常！请检查数据')
              .fontSize(14)
              .fontColor('#FF0000')
          } else {
            Text('正常')
              .fontSize(14)
              .fontColor('#008000')
          }
        }

        // 天气情况状态
        Column({ space: 10 }) {
          Stack({ alignContent: Alignment.Center }) {
            Image('$r(media.weather_icon)')
              .width(80)
              .height(80)
            if (!this.weatherStatus) {
              Circle()
                .width(20)
                .height(20)
                .backgroundColor('#FF0000')
                //.alignSelf(Alignment.TopEnd)
                .margin({ right: -5, top: -5 })
            }
          }
          Text('天气情况状态')
            .fontSize(16)
          if (!this.weatherStatus) {
            Text('恶劣！请注意防范')
              .fontSize(14)
              .fontColor('#FF0000')
          } else {
            Text('正常')
              .fontSize(14)
              .fontColor('#008000')
          }
        }
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .padding({ left: 20, right: 20 })
  }
}