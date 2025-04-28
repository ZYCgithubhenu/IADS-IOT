/*
 * 隐私协议界面
 * */
// 定义协议章节类型
interface PolicySection {
  title: string
  content: string
}

@Entry
@Component
struct PrivacyPolicyPage {
  @State isScrolledToBottom: boolean = false
  @State currentSection: number = 0

  // 使用类型化数据源
  private sectionList: PolicySection[] = [
    {
      title: "引言",
      content: "欢迎使用我们的慧农APP！本APP致力于为您提供高效、智能的农业服务。我们深知您的个人信息安全至关重要，因此制定了本隐私协议，向您详细说明我们如何收集、使用、共享、保护您的个人信息。请您在使用本APP前，仔细阅读并理解本隐私协议的全部内容。"
    },
    {
      title: "信息收集",
      content: "注册信息：当您注册本 APP 账号时，我们会收集您的手机号码、设置的密码以及您自愿填写的姓名、邮箱等信息，用于账号创建及后续的服务沟通。​\n" +
        "设备信息：为了保障 APP 的正常运行及提供个性化服务，我们会收集您的设备型号、操作系统版本、唯一设备标识符（如 IMEI、MAC 地址）等信息。这些信息有助于我们优化 APP 在不同设备上的兼容性。​\n" +
        "位置信息：若您开启位置权限，我们会获取您的地理位置信息。这有助于为您提供精准的农业气象、病虫害预警等与地理位置相关的服务。​\n" +
        "使用信息：我们会记录您在 APP 内的操作行为，包括但不限于浏览的页面、使用的功能、发布的内容、搜索记录等。这些信息用于分析您的使用习惯，以改进和优化我们的服务。​\n" +
        "传感器数据：如果您使用与 APP 连接的智能农业设备（如土壤湿度传感器、气象站等），我们会收集设备传输的传感器数据，以便为您提供农业生产的监测和分析服务。"
    },
    {
      title: "数据使用",
      content: "提供服务：我们使用收集到的信息为您提供智慧农业相关的各项服务，包括但不限于农业资讯推送、设备远程控制、生产数据分析报告等。​\n" +
        "个性化推荐：基于您的使用信息和偏好，我们会为您推送个性化的农业技术文章、产品推荐等内容，提升您的使用体验。​\n" +
        "改进服务：通过对收集到的数据进行分析，我们能够了解用户需求和行为模式，从而改进 APP 的功能和性能，为您提供更优质的服务。​\n" +
        "安全保障：利用收集的信息进行安全监测和风险评估，防止 APP 遭受恶意攻击、欺诈等安全威胁，保障您的账号和使用安全"
    },
    {
      title: "信息共享",
      content: "第三方服务提供商：我们可能会将您的个人信息共享给为我们提供技术支持、数据分析、云存储等服务的第三方合作伙伴。这些第三方仅能在我们的指示下处理您的信息，且需遵守严格的保密义务。​\n" +
        "法律要求：在法律要求的情况下，如响应法院传票、政府调查等，我们可能会披露您的个人信息。​\n" +
        "业务转让：若发生公司合并、收购、资产转让等业务变更情况，您的个人信息可能会被转移至相关的承接方，但我们会确保承接方继续遵守本隐私协议的规定。"
    },
    {
      title: "用户权利",
      content: "访问权：您有权随时访问您在本 APP 中存储的个人信息，包括注册信息、使用记录等。您可以通过 APP 内的个人中心或相关设置功能进行查看。​\n" +
        "更正权：如果您发现我们收集的关于您的个人信息存在错误或不准确，您有权要求我们进行更正。您可以通过联系我们的客服人员提出更正请求。​\n" +
        "删除权：在符合法律规定的情况下，您有权要求我们删除您的个人信息。例如，当您的账号不再使用时，您可以申请删除账号及相关信息。​\n" +
        "撤回同意权：对于某些需要您授权同意的信息收集和使用行为，您有权随时撤回同意。撤回同意后，我们将不再基于该同意进行相关的信息处理活动，但不影响此前已基于同意进行的处理。​\n" +
        "投诉权：如果您对我们的隐私政策或信息处理行为有任何疑问、意见或投诉，您可以通过 APP 内的客服渠道或我们提供的其他联系方式与我们取得联系，我们将及时予以回复和处理。"
    },
    {
      title: "变更条款",
      content: "我们可能会根据法律法规的变化、业务发展需求等原因对本隐私协议进行修订。修订后的隐私协议将在 APP 内进行公布，公布日期即为修订生效日期。若修订内容涉及对您个人信息处理方式的重大变更，我们将通过 APP 推送通知、短信等方式向您告知。请您定期查看本隐私协议，以了解最新的隐私政策。"
    }
  ]

  private scroller: Scroller = new Scroller()
  private icpNumber: string = '豫ICP备12345678号-1'

  build() {
    Stack() {
      // 主内容区域
      Scroll(this.scroller) {
        Column() {
          Text('隐私政策')
            .fontSize(24)
            .fontColor(Color.Black)
            .margin({ top: 20, bottom: 30 })
            .width('100%')
            .textAlign(TextAlign.Center)

          // 类型安全的ForEach
          ForEach(this.sectionList,
            (item: PolicySection, index: number) => {
              Column() {
                Text(`${index + 1}. ${item.title}`)
                  .id(`section${index}`)
                  .fontSize(18)
                  .fontColor('#007AFF')
                  .margin({ bottom: 8 })

                Text(item.content)
                  .fontSize(16)
                  .fontColor('#666')
                  .lineHeight(24)
                  .padding({ bottom: 30 })
                  .border({
                    width: 1,
                    color: index < this.sectionList.length - 1 ? '#F0F0F0' : Color.Transparent
                  })
              }
              .padding({ left: 24, right: 24 })
            },
            (item: PolicySection) => item.title // Key生成器
          )
        }
      }
      .onScroll((scrollOffset: number) => {
        this.isScrolledToBottom = scrollOffset >= this.scroller.currentOffset().yOffset
      })
      .width('100%')
      .height('85%')


    }
    .backgroundColor('#F5F5F5')
    .height('100%')
  }

}