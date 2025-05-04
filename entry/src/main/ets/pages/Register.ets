import { promptAction, router } from '@kit.ArkUI'
import ConnectionUtils from '../Common/network/ConnectionUtils';


/*
 * 登陆界面，也是app进入的首页面
 * */
@Extend(TextInput)//输入框样式
function inputStyle() {
  .placeholderColor('#99182431')
  .height('45vp')
  .fontSize('18fp')
  .backgroundColor('#F1F3F5')
  .width('100%')
  .margin({top:12})
}
@Extend(Line)//下划线样式
function lineStyle(){
  .width('100%')
  .height('1vp')
  .backgroundColor('#33182431')
}
@Extend(Text)//文字样式
function blueTextStyle(){
  .fontColor('#007DFF')
  .fontSize('14fp')
  .fontWeight(FontWeight.Medium)
}


@Entry
@Component
export  struct Register {
  @State account: string = '';//用户ID号
  @State password: string = '';//用户密码
  @State password1: string = '';//用户密码
  @State isShowProgress: boolean = false;//界面是否显示标记
  private timeOutId: number = -1;//倒计时，用于显示加载动画
  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height('48vp')
    .width('48vp')
    .backgroundColor('#F1F3F5')
  }
  register(result: boolean): void {
    // if(value2 == this.password){
    //   router.replaceUrl({url:"UserLoginPage"})
    // } else {
    //   promptAction.showToast({
    //     message:'密码不一致，请重新输入'
    //   })
    //   this.password == '';
    //   //this.login(true);
    // }
    if (this.password != this.password1) {
      promptAction.showToast({
        message:'密码不一致，请重新输入'
      })
      this.password == '';
      this.password1 == '';
    } else {
      this.isShowProgress = true;
      if (this.timeOutId === -1) {
        this.timeOutId = setTimeout(() => {
          this.isShowProgress = false;
          this.timeOutId = -1;
          router.replaceUrl({url:'pages/Index'});
          promptAction.showToast({
            message:'注册成功'
          })
        }, 2000);
      }
      //在此处添加数据库连接，将用户ID和密码传入数据库
    }
  }
  aboutToDisappear() {
    clearTimeout(this.timeOutId);
    this.timeOutId = -1;
  }//加载动画
  build() {
    Column(){
      Image($r('app.media.startIcon'))
        .width('78vp')
        .height('78vp')
        .margin({top: '130vp',bottom:'8vp'})
      Text('用户注册')
        .fontSize('24fp')
        .fontWeight(FontWeight.Medium)
        .fontColor('#182431')
      TextInput({placeholder:'手机号'})
        .type(InputType.Number)
        .maxLength(11)
        .inputStyle()
        .onChange((value:string) => {this.account= value})
      Line()
        .lineStyle()
      TextInput({placeholder:'密码'})
        .type(InputType.Password)
        .maxLength(8)
        .inputStyle()
        .onChange((value:string) => {this.password = value})
      Line()
        .lineStyle()
      TextInput({placeholder:'请再次输入密码'})
        .type(InputType.Password)
        .maxLength(8)
        .inputStyle()
        .onChange((value1:string) => {this.password1 = value1})
      Line()
        .lineStyle()
      Button('注册')
        .width('90%')
        .height('40vp')
        .fontSize('16fp')
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#007DFF')
        .margin({top:'48vp',bottom:'12vp'})
          // .onClick(async () => {
          //   await ConnectionUtils.isNetworkConnected().then((value) => {
          //     this.login(value);
          //   })
          // })此方法留作联网检测
        .onClick(() =>{this.register(true)})
      if (this.isShowProgress) {
        LoadingProgress()
          .color('#182431')
          .width('30vp')
          .height('30vp')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .padding({
      left: '12vp',
      right: '12vp',
      bottom: '24vp'
    })
  }
}
