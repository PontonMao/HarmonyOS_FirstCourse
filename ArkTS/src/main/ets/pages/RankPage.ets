import prompt from '@ohos.prompt';
import promptAction from '@ohos.promptAction';
import { APP_EXIT_INTERVAL, Style, TIME, TITLE, WEIGHT } from '../common/constants/Constants';
import { ListHeaderComponent } from '../view/ListHeaderComponent';
import { ListItemComponent } from '../view/ListItemComponent';
import { TitleComponent } from '../view/TitleComponent';
import { RankData } from '../viewmodel/RankData';
import { RankViewModel } from '../viewmodel/RankViewModel';

let rankModel: RankViewModel = new RankViewModel();

@Entry
@Component
struct RankPage {
  @State dataSource1: RankData[] = [];
  @State dataSource2: RankData[] = [];
  // 该状态用于决定是否切换RankList的数据。
  @State isSwitchDataSource: boolean = true;

  // It will record the time of clicking back button of system navigation.
  // 它将记录点击系统导航的后退按钮的时间。
  private clickBackTimeRecord: number = 0;


  @State message: string = '使用声明式语法和组件化基础知识，搭建一个可刷新的排行榜页面。在排行榜页面中，使用循环渲染控制语法来实现列表数据渲染，使用@Builder创建排行列表布局内容，使用装饰器@State、@Prop、@Link来管理组件状态。最后我们点击系统返回按键，来学习自定义组件生命周期函数。'

  @State decorator: string = `2.组件状态管理装饰器和@Builder装饰器：
  组件状态管理装饰器用来管理组件中的状态，它们分别是：@State、@Prop、@Link。

  @State装饰的变量是组件内部的状态数据，当这些状态数据被修改时，将会调用所在组件的build方法进行UI刷新。
  @Prop与@State有相同的语义，但初始化方式不同。@Prop装饰的变量必须使用其父组件提供的@State变量进行初始化，允许组件内部修改@Prop变量，但更改不会通知给父组件，即@Prop属于单向数据绑定。
  @Link装饰的变量可以和父组件的@State变量建立双向数据绑定，需要注意的是：@Link变量不能在组件内部进行初始化。
  @Builder装饰的方法用于定义组件的声明式UI描述，在一个自定义组件内快速生成多个布局内容。`;

  /**
   * 组件生命周期，即一般用@Component装饰的自定义组件的生命周期，提供以下生命周期接口：
   * aboutToAppear：组件即将出现时回调该接口，具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行。
   * aboutToDisappear：在自定义组件析构销毁之前执行。不允许在aboutToDisappear函数中改变状态变量，特别是@Link变量的修改可能会导致应用程序行为不稳定。
   */
  aboutToAppear() {
    this.dataSource1 = rankModel.loadRankDataSource1();
    this.dataSource2 = rankModel.loadRankDataSource2();
  }

  /**
   * 页面生命周期，即被@Entry装饰的组件生命周期，提供以下生命周期接口：
   * onPageShow：页面每次显示时触发一次，包括路由过程、应用进入前台等场景，仅@Entry装饰的自定义组件生效。
   * onPageHide：页面每次隐藏时触发一次，包括路由过程、应用进入前后台等场景，仅@Entry装饰的自定义组件生效。
   * onBackPress：当用户点击返回按钮时触发，仅@Entry装饰的自定义组件生效。
   */
  onBackPress() {
    console.error("onBackPress start")
    /**
     * 使用自定义组件生命周期函数
     * 我们通过点击系统导航返回按钮来演示onBackPress回调方法的使用，在指定的时间段内，如果满足退出条件，onBackPress将返回false，系统默认关闭当前页面。
     * 否则，提示用户需要再点击一次才能退出，同时onBackPress返回true，表示用户自己处理导航返回事件。
     */
    if (this.isShowToast()) {
      console.error("onBackPress isShowToast start")
      getContext(this).resourceManager.getStringValue($r('app.string.prompt_text').id).then(value => {
        promptAction.showToast({
          message: value,
          duration: TIME
        });
      })
      console.error("onBackPress isShowToast end")
      this.clickBackTimeRecord = new Date().getTime();
      console.error("onBackPress clickBackTimeRecord:" + this.clickBackTimeRecord)
      return true;
    }
    return false;
  }

  isShowToast(): boolean {
    return new Date().getTime() - this.clickBackTimeRecord > APP_EXIT_INTERVAL;
  }

  build() {
    Column() {
      // 顶部标题组件
      TitleComponent({ isRefreshData: $isSwitchDataSource, title: TITLE})
      // 列表头部样式
      ListHeaderComponent({
        paddingValue: {
          left: Style.RANK_PADDING,
          right: Style.RANK_PADDING
        },
        widthValue: Style.CONTENT_WIDTH
      })
        .margin({
          top: Style.HEADER_MARGIN_TOP,
          bottom: Style.HEADER_MARGIN_BOTTOM
        })
      // 列表区域
      this.RankList(Style.CONTENT_WIDTH)

      Text(this.message)
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
      Text(this.decorator)
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
    }
    .backgroundColor($r('app.color.background'))
    .width(WEIGHT)
    .height(WEIGHT)
  }

  /**
   * 为了简化代码，提高代码的可读性，我们使用@Builder描述排行列表布局内容，使用循环渲染组件ForEach创建ListItem。
   * @param widthValue
   */
  @Builder RankList(widthValue: Length) {
    Column() {
      List() {
        // 循环渲染：开发框架提供循环渲染（ForEach组件）来迭代数组，并为每个数组项创建相应的组件。
        ForEach(this.isSwitchDataSource ? this.dataSource1 : this.dataSource2,
          (item: RankData, index?: number) => {
            ListItem() {
              ListItemComponent({ index: (Number(index) + 1), name: item.name, vote: item.vote.toString(),
                isSwitchDataSource: this.isSwitchDataSource })
            }
          }, (item: RankData) => JSON.stringify(item))
      }
      .width(WEIGHT)
      .height(Style.LIST_HEIGHT)
      .divider({ strokeWidth: Style.STROKE_WIDTH })
    }
    .padding({
      left: Style.RANK_PADDING,
      right: Style.RANK_PADDING
    })
    .borderRadius(Style.BORDER_RADIUS)
    .width(widthValue)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}