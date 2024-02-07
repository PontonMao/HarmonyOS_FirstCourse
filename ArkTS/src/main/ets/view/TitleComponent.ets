
import AppContext from '@ohos.app.ability.common'
import { FontSize, TitleBarStyle, WEIGHT } from '../common/constants/Constants'

/**
 * 使用@Link封装标题组件
 * 在TitleComponent文件中，首先使用struct对象创建自定义组件，
 * 然后使用@Link修饰器管理TitleComponent组件内的状态变量isRefreshData，
 * 状态变量isRefreshData值发生改变后，通过@Link装饰器通知页面刷新List中的数据。
 */
@Component
export struct TitleComponent {
  @Link isRefreshData: boolean; // 判断是否刷新数据
  @State title: Resource = $r('app.string.title_default')

  build() {
    Row() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .height(TitleBarStyle.IMAGE_BACK_SIZE)
          .width(TitleBarStyle.IMAGE_BACK_SIZE)
          .margin({right: TitleBarStyle.IMAGE_BACK_MARGIN_RIGHT})
          .onClick(() => {
            let handler = getContext(this) as AppContext.UIAbilityContext
            handler.terminateSelf();
          })
        Text(this.title)
          .fontSize(FontSize.LARGE)
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      .justifyContent(FlexAlign.Start)

      Row() {
        Image($r('app.media.loading'))
          .height(TitleBarStyle.IMAGE_LOADING_SIZE)
          .width(TitleBarStyle.IMAGE_LOADING_SIZE)
          .onClick(() => {
            this.isRefreshData = !this.isRefreshData;
          })
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      .justifyContent(FlexAlign.End)
    }
    .width(WEIGHT)
    .padding({ left: TitleBarStyle.BAR_MARGIN_HORIZONTAL,
      right: TitleBarStyle.BAR_MARGIN_HORIZONTAL })
    .margin({ top: TitleBarStyle.BAR_MARGIN_TOP })
    .height(TitleBarStyle.BAR_HEIGHT)
    .justifyContent(FlexAlign.SpaceAround)
  }
}