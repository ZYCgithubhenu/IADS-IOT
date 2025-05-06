@Entry
@Component
struct Crop {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Text('作物百科')
        .width('100%')
        .margin({
          top: '20vp',
          bottom: '12vp',
          left:'16vp'
        })
        .fontWeight(700)
        .fontSize('28fp')
    }
    .height('100%')
    .width('100%')
  }
}