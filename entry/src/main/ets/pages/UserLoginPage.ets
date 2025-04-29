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
export  struct UserLoginPage {
  @State account: string = '';//用户ID号
  @State password: string = '';//用户密码
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
  login(result: boolean): void {
    if (this.account === '' || this.password=== '') {
      promptAction.showToast({
        message: ('账号或密码不能为空')
      })
    } else {
      this.isShowProgress = true;
      if (this.timeOutId === -1) {
        this.timeOutId = setTimeout(() => {
          this.isShowProgress = false;
          this.timeOutId = -1;
          // if (result) {
          //   router.replaceUrl({url:'pages/Index'});//点击登录按钮后跳转到Index页面
          // } else {
          //   promptAction.showToast({
          //     message: '无网络连接，无法登录'
          //   });
          // }此处留作连接数据库
          router.replaceUrl({url:'pages/Index'});//点击登录按钮后跳转到Index页面
        }, 2000);

      }
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
        Text('欢迎登录')
          .fontSize('24fp')
          .fontWeight(FontWeight.Medium)
          .fontColor('#182431')
        Text('登录账号以获得更多服务')
          .fontSize('16fp')
          .fontColor('#99182431')
          .margin({bottom:'30vp',top:'8vp'})
        TextInput({placeholder:'账号'})
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
        Row(){
          Text('短信验证码登录')
            .blueTextStyle()
          Text('忘记密码')
            .blueTextStyle()
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({top:'8vp'})
        Button('登录')
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
          .onClick(() =>{
            this.login(true);
          })
        Text('注册账号')
          .fontSize('16fp')
          .fontWeight(FontWeight.Medium)
          .fontColor('#007DFF')
        if (this.isShowProgress) {
          LoadingProgress()
            .color('#182431')
            .width('30vp')
            .height('30vp')
            .margin({ top: '20vp' })
        }
        Blank();
        Text('其他登陆方式')
          .fontColor('#838D97')
          .fontSize('12fp')
          .fontWeight(FontWeight.Medium)
          .margin({ top: '50vp' })
        Row({space:55}){
          this.imageButton($r('app.media.login_method1'))
          this.imageButton($r('app.media.login_method2'))
        }
        Row(){
          Checkbox(){
            Text('登录即代表同意')
              .fontSize('16fp')
              .fontColor(Color.Gray)
            Text('用户隐私政策')
              .fontSize('16fp')
              .fontColor(Color.Blue)
              .onClick(() => {
                router.pushUrl({url:'pages/PrivacyPolicy/PrivacyPolicy'})
              })
          }
          .shape(CheckBoxShape.CIRCLE)
        }
        .margin({top:20})


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
