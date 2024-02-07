
import { FontSize, FontWeight, ItemStyle, WEIGHT } from '../common/constants/Constants';
/**
 * 创建ListItemComponent
 * 为了体现@Prop单向绑定功能，我们在ListItemComponent组件中添加了一个@Prop修饰的字段isSwitchDataSource，
 * 当通过点击改变ListItemComponent组件中isSwitchDataSource状态时，ListItemComponent作为List的子组件，并不会通知其父组件List刷新状态。
 * 在代码中，我们使用@State管理ListItemComponent中的 isChange 状态，当用户点击ListItemComponent时，
 * ListItemComponent组件中的文本颜色发生变化。我们使用条件渲染控制语句，创建的圆型文本组件。
 */
@Component
export struct ListItemComponent {
  index?: number;
  private name?: Resource;
  @Prop vote: string = '';
  @Prop isSwitchDataSource: boolean = false;
  // 判断是否改变ListItemComponent字体颜色
  @State isChange: boolean = false;

  build() {
    Row() {
      Column() {
        // 1.渲染控制语法：
        // 条件渲染：使用if/else进行条件渲染。
        if (this.isRenderCircleText()) {
          if (this.index !== undefined) {
            this.CircleText(this.index);
          }
        } else {
          Text(this.index?.toString())
            .lineHeight(ItemStyle.TEXT_LAYOUT_SIZE)
            .textAlign(TextAlign.Center)
            .width(ItemStyle.TEXT_LAYOUT_SIZE)
            .fontWeight(FontWeight.BOLD)
            .fontSize(FontSize.SMALL)
        }
      }
      .width(ItemStyle.LAYOUT_WEIGHT_LEFT)
      .alignItems(HorizontalAlign.Start)

      Text(this.name)
        .width(ItemStyle.LAYOUT_WEIGHT_CENTER)
        .fontWeight(FontWeight.BOLDER)
        .fontSize(FontSize.MIDDLE)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)
      Text(this.vote)
        .width(ItemStyle.LAYOUT_WEIGHT_RIGHT)
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)
    }
    .height(ItemStyle.BAR_HEIGHT)
    .width(WEIGHT)
    .onClick(() => {
      this.isSwitchDataSource = !this.isSwitchDataSource;
      this.isChange = !this.isChange;
    })
  }

  isRenderCircleText(): boolean {
    // 只需渲染列表中第四个元素之前的元素即可。
    return this.index === 1 || this.index === 2 || this.index === 3;
  }

  /**
   * 圆型文本组件
   * @param index
   */
  @Builder CircleText(index: number) {
    Row() {
      Text(this.index?.toString())
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(Color.White);
    }
    .justifyContent(FlexAlign.Center)
    .borderRadius(ItemStyle.CIRCLE_TEXT_BORDER_RADIUS)
    .size({ width: ItemStyle.CIRCLE_TEXT_SIZE,
      height: ItemStyle.CIRCLE_TEXT_SIZE })
    .backgroundColor($r('app.color.circle_text_background'))
  }
}