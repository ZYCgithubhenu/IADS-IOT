import { Font } from '@ohos.arkui.UIContext';

// 设备状态枚举
enum DeviceStatus {
  ONLINE = 'online',
  OFFLINE = 'offline',
  FAULT = 'fault'
}

// 设备接口
interface Device {
  id: string;
  name: string;
  icon: Resource;
  status: DeviceStatus;
  location: string;
}

@Entry
@Component
struct SmartFarmDeviceManagement {
  // 状态管理
  @State selectedFarm: string = '农田A';
  @State farms: string[] = ['农田A', '农田B', '农田C'];

  @State devices: Device[] = [
    {
      id: 'DEV-2023001',
      name: '灌溉泵-01',
      icon: $r('app.media.ic_irrigation'),
      status: DeviceStatus.ONLINE,
      location: '农田A-3号地块'
    },
    {
      id: 'DEV-2023002',
      name: '土壤传感器-02',
      icon: $r('app.media.ic_sensor'),
      status: DeviceStatus.OFFLINE,
      location: '农田A-3号地块'
    },
    {
      id: 'DEV-2023003',
      name: '温度传感器-03',
      icon: $r('app.media.ic_temp'),
      status: DeviceStatus.OFFLINE,
      location: '农田A-3号地块'
    },
    {
      id: 'DEV-2023004',
      name: '湿度传感器-04',
      icon: $r('app.media.ic_hygrometer'),
      status: DeviceStatus.OFFLINE,
      location: '农田A-3号地块'
    },
    {
      id: 'DEV-2023005',
      name: '温度传感器-03',
      icon: $r('app.media.ic_temp'),
      status: DeviceStatus.OFFLINE,
      location: '农田A-4号地块'
    },
    {
      id: 'DEV-2023006',
      name: '温度传感器-03',
      icon: $r('app.media.ic_temp'),
      status: DeviceStatus.OFFLINE,
      location: '农田A-4号地块'
    },
    {
      id: 'DEV-2023007',
      name: '温度传感器-03',
      icon: $r('app.media.ic_temp'),
      status: DeviceStatus.OFFLINE,
      location: '农田A-4号地块'
    }

  ];

  build() {
    Stack(){
      Stack()
        .width('100%')
        .height('100%')
        .backgroundColor('#E6F7FF')
      Column() {
        this.buildAppBar()
        this.buildDeviceList()
      }
      .width('100%')
    }

  }

  // 顶部应用栏
  @Builder
  buildAppBar() {
    Column() {
      Select([{value:"农田A"},{value:"农田B"},{value:"农田C"}])
        .selected(0)
        .value("农田A")
        .onSelect((index) => this.selectedFarm = this.farms[index])
        .fontColor($r('sys.color.black'))
        .selectedOptionFont({ size: 16, weight: FontWeight.Medium })
        .optionFont({ size: 14 })
        .backgroundColor('#2A5CAA')
        .padding(12)
        .borderRadius(4)
        .padding({ left: 12, right: 12, top: 6, bottom: 6 })
    }
    .width('100%')
    .backgroundColor('#2A5CAA')
    .shadow({ radius: 4, color: '#1F000000' })
  }

  // 设备列表
  @Builder
  buildDeviceList() {
    List({ space: 12 }) {
      ForEach(this.devices, (device: Device) => {
        ListItem() {
          Column(){
            Row() {
              // 设备图标
              Column(){
                Image(device.icon)
                  .width(40)
                  .height(40)
                  .margin({ right: 8 })
              }
              .width("45%")
              // 设备信息
              Column() {
                Text(device.name)
                  .fontSize(16)
                  .fontColor('#333333')
                  .fontWeight(FontWeight.Medium)
                Text(`ID: ${device.id}`)
                  .fontSize(12)
                  .fontColor('#666666')
              }
              .width("45%")
            }
            .width("90%")
            .margin(5)
            Row() {
              // 状态指示
              Column(){
                Row(){
                  Circle()
                    .width(16)
                    .height(10)
                    .fill(/*this.getStatusColor(device.status)*/"#4CAF50")
                  Text(/*this.getStatusText(device.status)*/"在线")
                    .fontSize(14)
                    .fontColor(/*this.getStatusColor(device.status)*/"#4CAF50")
                }
              }
              .width("45%")
              // 位置信息
              Column() {
                Row(){
                  Image($r('app.media.ic_location'))
                    .width(16)
                    .height(16)
                  Text(device.location)
                    .fontSize(14)
                    .fontColor('#666666')
                }
              }
              .width("45%")
            }
            .width("90%")
            .margin(5)
            Row(){
              // 操作按钮
              Column(){
                Button('详情')
                  .width(72)
                  .height(32)
                  .border({ width: 1, color: '#2A5CAA' })
                  .fontColor('#FFFFFF')
              }
              .width("45%")
              Column(){
                Button('控制')
                  .width(72)
                  .height(32)
                  .backgroundColor('#2A5CAA')
                  .fontColor('#FFFFFF')
              }
              .width("45%")
            }
            .width("90%")
            .margin(5)
          }
          .justifyContent(FlexAlign.End)
          .margin({top:10})
          .backgroundColor(Color.White)
          .border({
            width: 1,
            color: '#CCCCCC',
            style: BorderStyle.Solid
          })
          .borderRadius(8)
        }
      }, (device: Device) => device.id)
    }
    .width('100%')
    .height("90%")
    .divider({ strokeWidth: 1, color: '#EEEEEE' })
  }
  // private getStatusColor(status: DeviceStatus): ResourceColor {
  //   const colorKeys = {
  //     [DeviceStatus.ONLINE]: $r('app.color.status_online'),
  //     [DeviceStatus.OFFLINE]: $r('app.color.status_offline'),
  //     [DeviceStatus.FAULT]: $r('app.color.status_fault')
  //   };
  //   return colorKeys[status];
  // }
  //
  // private getStatusText(status: DeviceStatus): Resource {
  //   const textKeys = {
  //     [DeviceStatus.ONLINE]: $r('app.string.status_online'),
  //     [DeviceStatus.OFFLINE]: $r('app.string.status_offline'),
  //     [DeviceStatus.FAULT]: $r('app.string.status_fault')
  //   };
  //   return textKeys[status];
  // }
}