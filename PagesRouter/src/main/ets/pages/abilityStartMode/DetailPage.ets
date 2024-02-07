import Want from '@ohos.app.ability.Want'
import router from '@ohos.router'
import { getContextData } from '../../common/utils/Util'
@Entry
@Component
struct Index {
  @State want: Want = null

  aboutToAppear() {
    this.want = getContextData()
  }

  build() {
    Row() {
      Column() {
        Text('UIAbility 启动模式结果页面')
        Blank(20)
        Text("启动参数如下：")
        Text(JSON.stringify(this.want))
        Blank(20)
        Text("自定义参数hi=" + this.want?.parameters?.['hi'])
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
        Blank(20)
        Button('关闭')
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}