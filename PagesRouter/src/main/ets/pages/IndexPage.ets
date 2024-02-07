import router from '@ohos.router';
import CommonConstants from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger';
import { startAbilityMode, startMode } from '../common/utils/Util';

const TAG = '[IndexPage]'

class routerParams {
  src: string

  constructor(str: string) {
    this.src = str
  }
}

@Entry
@Component
struct Index {
  @State message: string = CommonConstants.INDEX_MESSAGE;
  @State src: string = '';

  // 页面显示
  onPageShow() {
    console.log('page1......onPageShow')
    try {
      // 可以在此生命周期获取参数
      this.src = (router.getParams() as routerParams).src
    } catch (err) {
      Logger.info(TAG, 'onPageShow err is ' + JSON.stringify(err));
    };
  }
  // 页面隐藏
  onPageHide() {
    console.log('page1......onPageHide')
  }
  // 页面返回
  onBackPress() {
    console.log('page1......onBackPress')
  }

  aboutToAppear() {
    console.log('组件本身......aboutToAppear')
  }
  // 组件销毁时触发：删除 移出
  aboutToDisappear() {
    console.log('组件本身......aboutToDisappear')
  }

  build() {
    Row() {
      Column() {
        // singleton（单实例模式）
        // singleton启动模式为单实例模式，也是默认情况下的启动模式。
        // 每次调用startAbility()方法时，如果应用进程中该类型的UIAbility实例已经存在，则复用系统中的UIAbility实例。
        // 系统中只存在唯一一个该UIAbility实例，即在最近任务列表中只存在一个该类型的UIAbility实例。
        // singleton启动模式的开发使用，在module.json5文件中的“launchType”字段配置为“singleton”即可。
        // singleton 不配置 都为 单实例模式
        Button('单实例模式：singleton模式启动另一个UIAbility')
          .fontSize(CommonConstants.BUTTON_FONT_SIZE1)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            // startMode({}, 'SingletonAbility')
            startAbilityMode('SingletonAbility', {hi: "singleton模式启动另一个UIAbility"})
          })
        Blank(10)
        // multiton（多实例模式）
        // multiton启动模式为多实例模式，每次调用startAbility()方法时，都会在应用进程中创建一个新的该类型UIAbility实例。
        // 即在最近任务列表中可以看到有多个该类型的UIAbility实例。这种情况下可以将UIAbility配置为multiton（多实例模式）。
        // multiton启动模式的开发使用，在module.json5配置文件中的launchType字段配置为multiton即可。
        // 这里实际配置为multiton是单实例模式，配置为standard才为多实例模式，不知道是否课程问题。
        Button('多实例模式：standard模式启动另一个UIAbility')
          .fontSize(CommonConstants.BUTTON_FONT_SIZE1)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            // startMode({}, 'MultitonAbility')
            startAbilityMode('MultitonAbility', {hi: "standard模式启动另一个UIAbility"})
          })
        Blank(10)
        // specified（指定实例模式）
        // specified启动模式为指定实例模式，针对一些特殊场景使用
        // （例如文档应用中每次新建文档希望都能新建一个文档实例，重复打开一个已保存的文档希望打开的都是同一个文档实例）。
        Button('指定实例模式：specified模式启动另一个UIAbility(新开页面)')
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            // 增加自定义参数，如myInstanceKey:'key1',用于区分UIAbility实例
            startAbilityMode('SpecifiedAbility', {
              hi: "specified模式启动另一个UIAbility(每次新开页面)",
              myInstanceKey: `key1_${new Date().getTime()}`
            })
          })
        Blank().height(5)
        Button('指定实例模式：specified模式启动另一个UIAbility(复用页面)')
          .margin({ top: 5})
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            // 增加自定义参数，如myInstanceKey:'key1',用于区分UIAbility实例
            startAbilityMode('SpecifiedAbility', {
              hi: "specified模式启动另一个UIAbility(复用页面)",
              myInstanceKey: `key2`
            })
          })
        Blank(10)
        Text(this.message)
          .fontSize(CommonConstants.FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Blank(10)
        Text(this.src)
          .fontSize(CommonConstants.BUTTON_FONT_SIZE)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
        Blank(10)
        // Button($r('app.string.next'))
        //   .fontSize(CommonConstants.BUTTON_FONT_SIZE)
        //   .width(CommonConstants.BUTTON_WIDTH)
        //   .height(CommonConstants.BUTTON_HEIGHT)
        //   .backgroundColor($r('app.color.button_bg'))
        //   .onClick(() => {
        //     router.pushUrl({
        //       url: CommonConstants.SECOND_URL,
        //       params: {
        //         src: CommonConstants.SECOND_SRC_MSG
        //       }
        //     }).catch((error: Error) => {
        //       Logger.info(TAG, 'IndexPage push error' + JSON.stringify(error));
        //     });
        //   })
        this.nextPushButton($r('app.string.next_push_standard'), router.RouterMode.Standard)
        Blank(10)
        this.nextPushButton($r('app.string.next_push_single'), router.RouterMode.Single)
        Blank(10)
        this.nextReplaceButton($r('app.string.next_replace_standard'), router.RouterMode.Standard)
        Blank(10)
        this.nextReplaceButton($r('app.string.next_replace_single'), router.RouterMode.Single)
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.LAYOUT_HEIGHT)
    }
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.page_bg'))
  }


  @Builder nextPushButton(label: Resource, model: router.RouterMode) {
    Button(label)
      .fontSize(CommonConstants.BUTTON_FONT_SIZE)
      .width(CommonConstants.BUTTON_WIDTH)
      .height(CommonConstants.BUTTON_HEIGHT)
      .backgroundColor($r('app.color.button_bg'))
      .onClick(() => {
        router.pushUrl({
          url: CommonConstants.SECOND_URL,
          params: {
            src: CommonConstants.SECOND_SRC_MSG
          }
        }, model).catch((error: Error) => {
          Logger.info(TAG, 'IndexPage push error' + JSON.stringify(error));
        });
      })
  }

  @Builder nextReplaceButton(label: Resource, model: router.RouterMode) {
    Button(label)
      .fontSize(CommonConstants.BUTTON_FONT_SIZE)
      .width(CommonConstants.BUTTON_WIDTH)
      .height(CommonConstants.BUTTON_HEIGHT)
      .backgroundColor($r('app.color.button_bg'))
      .onClick(() => {
        router.replaceUrl({
          url: CommonConstants.SECOND_URL,
          params: {
            src: CommonConstants.SECOND_SRC_MSG
          }
        }, model).catch((error: Error) => {
          Logger.info(TAG, 'IndexPage replace error' + JSON.stringify(error));
        });
      })
  }
}