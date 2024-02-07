
import CommonConstants from '../common/constants/CommonConstant';
/**
 * 自定义子组件
 * 在ToDoItem.ets文件中，显示的文本内容为入参content，使用@State修饰参数isComplete来管理当前事项的完成状态。
 * 当点击当前ToDoItem时，触发Row组件的onClick事件，更新isComplete的值，isComplete的改变将会刷新使用该状态变量的UI组件。
 * 具体表现为：当前点击的ToDoItem中，labelIcon图片的替换、文本透明度opacity属性的变化、文本装饰线decoration的显隐。
 */
@Component
export default struct ToDoItem {
  private content?: string;
  @State isComplete: boolean = false;

  @Builder labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    Row() {
      if (this.isComplete) {
        this.labelIcon($r('app.media.ic_ok'))
      } else {
        this.labelIcon($r('app.media.ic_default'))
      }

      Text(this.content)
        .fontSize($r('app.float.item_font_size'))
        .fontWeight(CommonConstants.FONT_WEIGHT)
        .opacity(this.isComplete ? CommonConstants.OPACITY_COMPLETED : CommonConstants.OPACITY_DEFAULT)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .borderRadius(CommonConstants.BORDER_RADIUS)
    .backgroundColor($r('app.color.start_window_background'))
    .width(CommonConstants.LIST_DEFAULT_WIDTH)
    .height($r('app.float.list_item_height'))
    .onClick(() => {
      this.isComplete = !this.isComplete;
    })
  }
}