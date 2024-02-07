
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import BaseUIAbility from '../common/BaseUIAbility';


export default class PagesRouterAbility extends BaseUIAbility {
  onCreate(want, launchParam) {
    // 应用初始化
    // Create状态，在UIAbility实例创建时触发，系统会调用onCreate回调。可以在onCreate回调中进行相关初始化操作。
    // 例如用户打开电池管理应用，在应用加载过程中，在UI页面可见之前，可以在onCreate回调中读取当前系统的电量情况，用于后续的UI页面展示。
    super.onCreate(want, launchParam)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    // 系统资源的释放、数据的保存等
    // 例如用户使用应用的程序退出功能，会调用UIAbilityContext的terminalSelf()方法，从而完成UIAbility销毁。
    // 或者用户使用最近任务列表关闭该UIAbility实例时，也会完成UIAbility的销毁。
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    // 设置UI页面加载
    // 设置WindowStage的事件订阅（获焦/失焦、可见/不可见）
    // 例如用户打开游戏应用，正在打游戏的时候，有一个消息通知，打开消息，消息会以弹窗的形式弹出在游戏应用的上方，
    // 此时，游戏应用就从获焦切换到了失焦状态，消息应用切换到了获焦状态。
    // 对于消息应用，在onWindowStageCreate回调中，会触发获焦的事件回调，可以进行设置消息应用的背景颜色、高亮等操作。
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/IndexPage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    // 释放UI页面资源
    // 例如在onWindowStageCreate中设置的获焦/失焦等WindowStage订阅事件。
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    // 申请系统需要的资源，或者重新申请在onBackground中释放的资源
    // 例如用户打开地图应用查看当前地理位置的时候，假设地图应用已获得用户的定位权限授权。
    // 在UI页面显示之前，可以在onForeground回调中打开定位功能，从而获取到当前的位置信息。
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    // 释放UI页面不可见时无用的资源，或者在此回调中执行较为耗时的操作
    // 例如状态保存等
    // 当地图应用切换到后台状态，可以在onBackground回调中停止定位功能，以节省系统的资源消耗。
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
