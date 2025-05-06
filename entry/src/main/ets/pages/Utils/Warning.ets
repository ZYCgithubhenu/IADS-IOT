interface Alarms{
  time: string;
  location: string;
  type: string;
  status: 'normal' | 'warning' | 'emergency'
}

@Entry
@Component
struct Warning {
  // 模拟预警数据
  private alarms: Alarms[] = [
    { time: '09:15', location: '农田A区', type: '土壤湿度异常', status: 'emergency' },
    { time: '08:40', location: '农田B区', type: '温度过高', status: 'warning' },
    { time: '07:30', location: '农田C区', type: '设备离线', status: 'normal' }
  ];

  build() {
    Column() {
      // 顶部标题栏
      Stack() {
        Row() {
          Text("智慧农业预警系统")
            .fontSize(20)
            .fontWeight(500)
            .margin(16)

          //  Spacer()
          //
          // Button("刷新")
          //   .margin(16)
          //   .padding(8,)
          //   .backgroundColor('#F5F5F5')
          //   .fontSize(14)
          //   .borderRadius(20)
        }
        .height(60)
        //.borderBottom(1)
        .borderColor('#E5E5E5')
      }

      // 地图区域（图片占位）
      Image($r('app.media.yumi'))  // 替换为实际图片路径
        .objectFit(ImageFit.Contain)
        .aspectRatio(16 / 9)
        .width('100%')
        .margin(16)
        .shadow(10)
      //.clipRRect(12)

      // 预警信息列表
      Column() {
        Text("实时预警信息")
          .fontSize(16)
          .fontWeight(500)
          .margin({ left: 16, bottom: 8 })

        List() {
          ForEach(this.alarms, (alarm:Alarms, index) => {
            ListItem() {
              Row({ space: 16 })
              {
                // 左侧：预警重要程度
                Column({ space: 4 }) {
                  Text(alarm.status.toUpperCase())
                    .fontSize(14)
                    .fontWeight(500)
                    .fontColor('white')
                    .padding(4)
                    .backgroundColor(this.getAlarmColor(alarm.status))
                    .borderRadius(10)
                }
                .width('20%')

                // 右侧：时间和地块位置
                Column({ space: 4 }) {
                  Text(alarm.time)
                    .fontSize(12)
                    .opacity(0.6)

                  Text(alarm.location)
                    .fontSize(14)
                    .fontWeight(500)

                  Text(alarm.type)
                    .fontSize(12)
                    .opacity(0.8)
                }
                .width('80%')
              }
              .padding(16)
              .backgroundColor(this.getAlarmBgColor(alarm.status))
              .shadow(5)
              //.clipRRect(12)
              .margin({ bottom: 8, left: 10, right: 16 })
              .width('100%')
            }
          })
        }
      }
      .flexGrow(1)
    }
    //.paddingTop(StatusBar.currentHeight)  // 适配状态栏
    .backgroundColor('#F8F9FA')
  }

  // 获取预警状态颜色
  private getAlarmColor(status: 'normal' | 'warning' | 'emergency'): string {
    switch (status) {
      case 'normal': return '#4CAF50';
      case 'warning': return '#FFC107';
      case 'emergency': return '#F44336';
    }
  }

  // 获取预警背景颜色
  private getAlarmBgColor(status: 'normal' | 'warning' | 'emergency'): string {
    switch (status) {
      case 'normal': return 'rgba(76, 175, 80, 0.1)';
      case 'warning': return 'rgba(255, 193, 7, 0.1)';
      case 'emergency': return 'rgba(244, 67, 54, 0.1)';
    }
  }
}
    