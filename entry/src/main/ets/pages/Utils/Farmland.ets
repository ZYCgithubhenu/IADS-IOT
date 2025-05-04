interface SensorItem{
  name:string;
  value:string
}
// 智慧农田监测界面示例
@Entry
@Component
struct FarmMonitorPage {
  @State currentFarm: string = '农田A'
  @State alarmStatus: boolean = true
  @State isPanelCollapsed: boolean = false
  @State alarmOpacity: number = 1  // 新增状态变量用于控制透明度
  @State scaleValue: number = 1; // 控制缩放的状态变量
  @State private sensorData: SensorItem[] = [
    { name: '温度', value: '25℃' },
    { name: '湿度', value: '60%' },
    { name: '二氧化碳浓度', value: '1200ppm' }
  ];

  build() {
    Stack() {
      // 纯色背景，使用一个符合主题的颜色，这里用淡蓝色为例
      Stack()
        .width('100%')
        .height('100%')
        .backgroundColor('#E6F7FF')
      Column() {
        // 顶部导航栏
        this.buildTopBar()
        // 主内容区
        Row() {
          // 左侧地图区 (占70%)
          Column() {
            this.buildMapSection()
            this.buildDataStream()
          }
          .width('70%')
          .padding(8)

          // 右侧面板区
          Column() {
            this.buildDashboard()
            this.buildControlPanel()
          }
          .width('30%')
          .padding(8)
        }
        .layoutWeight(1)  // 剩余空间填充
      }
      .height('100%')
    }
  }

  // 顶部导航栏组件
  @Builder
  buildTopBar() {
    Row({ space: 20 }) {
      // 农田选择
      Select([{ value: '农田A' }, { value: '农田B' }])
        .selected(0)
        .value("农田A")
        .onSelect((index, value) => {
          this.currentFarm = value as string
        })
        //.fontSize(16)
        .fontColor($r('sys.color.black'))
        .backgroundColor('#ffffffff')
        .borderRadius(4)
        .padding({ left: 12, right: 12, top: 6, bottom: 6 })

      // 报警指示灯
      Circle()
        .width(24)
        .height(24)
        .fill(this.alarmStatus ? '#FF5252' : '#4CAF50')
        .opacity(this.alarmOpacity)  // 设置透明度
        .onAppear(() => {
          if (this.alarmStatus) {
            // 使用animateTo替代Animator
            animateTo({
              duration: 1000,
              iterations: -1,       // Infinity改为-1
              playMode: PlayMode.Alternate,
              curve: Curve.Linear
            }, () => {
              this.alarmOpacity = 0.3 // 动画目标值
            })
          }
        })
    }
    .width('100%')
    .padding(16)
    .justifyContent(FlexAlign.SpaceBetween)
    .shadow({ radius: 4, color: '#1F000000' })
  }

  // 地图区域
  @Builder
  buildMapSection() {
    Stack() {
      // 基础地图
      Image($r('app.media.yumi'))
        .width('100%')
        .aspectRatio(1.5)
        .borderRadius(8)
        .shadow({ radius: 4, color: '#1F000000' })
    }
    .height('50%')
    .padding(8)
  }

  // 实时数据仪表盘
  @Builder
  buildDashboard() {
    Column() {
      Text('环境监测')
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
        .fontColor('#2A5CAA')
        .margin({ bottom: 16 })

      // 温度仪表
      Gauge({ value: 25, min: 0, max: 100 }) {
        Column() {
          Text('温度')
            .fontSize(16)
            .fontWeight(500)
            .margin({ top: 40 })
        }
        .width('100%')
        .height('100%')
      }
      .startAngle(270)
      .endAngle(90)
      .description(null)
      .colors(new LinearGradient([
        { color: "#FF5E5D", offset: 0 },
        { color: "#FFCE2D", offset: 0.2 },
        { color: "#1EC77A", offset: 1 },
      ]))
      .strokeWidth(12)
      .width(100)
      .height(120)
      .margin({ bottom: 5 })
      // 湿度仪表
      Gauge({ value: 60, min: 0, max: 100 }) {
        Column() {
          Text('湿度')
            .fontSize(16)
            .fontWeight(500)
            .margin({ top: 40 })
        }
        .width('100%')
        .height('100%')
      }
      .startAngle(270)
      .endAngle(90)
      .description(null)
      .colors(new LinearGradient([
        { color: "#FF5E5D", offset: 0 },
        { color: "#FFCE2D", offset: 0.2 },
        { color: "#1EC77A", offset: 1 },
      ]))
      .strokeWidth(12)
      .width(100)
      .height(120)
    }
  }

  // 设备控制面板
  @Builder
  buildControlPanel() {
    Column() {
      Text('设备控制')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor('#2A5CAA')
        .margin({ bottom: 16 })

      Toggle({ type: ToggleType.Checkbox, isOn: true })
        .onChange((isOn) => {
          // 控制灌溉系统
        })
        .width('100%')
        // .fontSize(16)
        // .fontColor('#333333')
    }
    .cardStyle()
  }

  // 实时数据流
  @Builder
  buildDataStream() {
    Column() {
      Text('实时数据流')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor('#2A5CAA')
        .margin({ bottom: 16 })

      List() {
        ForEach(this.sensorData, (item:SensorItem) => {
          ListItem() {
            Text(`${item.name}: ${item.value}`)
              .fontSize(16)
              .fontColor('#333333')
          }
          .padding({ left: 16, right: 16, top: 8, bottom: 8 })
          .backgroundColor('#FFFFFF')
          .borderRadius(4)
          .shadow({ radius: 2, color: '#1F000000' })
          .margin({ bottom: 8 })
        })
      }
      .height(120)
    }
    .cardStyle()
  }
}

// 卡片样式扩展方法
@Extend(Column)
function cardStyle() {
    .margin(8)
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(8)
    .shadow({ radius: 4, color: '#1F000000' })
}
