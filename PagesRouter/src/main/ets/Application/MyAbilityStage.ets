import AbilityStage from '@ohos.app.ability.AbilityStage';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Logger from '../common/utils/Logger'

const TAG = '[MyAbilityStage_StartMode]'

// specified多实例功能实现：specified模式则是根据MyAbilityStage中的onAcceptWant函数给用户返回一个ability标识，
// 如果之前启动过标识的ability，不创建新的实例并拉回栈顶，否则创建新的实例并启动。
export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    // 应用的HAP在首次加载的时，为该Module初始化操作
    Logger.info(TAG, 'MyAbilityStage onCreate')
  }

  // 仅specified模式下触发
  //
  // 由于SpecifiedAbility的启动模式被配置为指定实例启动模式，因此在SpecifiedAbility启动之前，
  // 会先进入对应的AbilityStage的onAcceptWant()生命周期回调中，以获取该UIAbility实例的Key值。然后系统会自动匹配，
  // 如果存在与该UIAbility实例匹配的Key，则会启动与之绑定的UIAbility实例，并进入该UIAbility实例的onNewWant()回调函数；
  //  （当应用的UIAbility实例已经被创建，并且配置为指定实例模式时，如果再次调用startAbility()方法启动该UIAbility实例，
  //    且AbilityStage的onAcceptWant()回调匹配到一个已创建的UIAbility实例，则系统会启动原来的UIAbility实例，
  //    并且不会重新创建一个新的UIAbility实例。此时，该UIAbility实例的onNewWant()回调会被触发，
  //    而不会触发onCreate()和onWindowStageCreate()生命周期回调。）
  // 否则会创建一个新的UIAbility实例，并进入该UIAbility实例的onCreate()回调函数和onWindowStageCreate()回调函数。
  //
  // 下面代码中，通过实现onAcceptWant()生命周期回调函数，解析传入的want参数，获取自定义参数instanceKey。
  // 业务逻辑会根据这个参数返回一个字符串Key，用于标识当前UIAbility实例。
  // 如果返回的Key已经对应一个已启动的UIAbility实例，系统会将该UIAbility实例拉回前台并获焦，而不会创建新的实例。
  // 如果返回的Key没有对应已启动的UIAbility实例，则系统会创建新的UIAbility实例并启动。
  onAcceptWant(want) {
    // 在被调用方的AbilityStage中，针对启动模式为specified的UIAbility返回一个UIAbility实例对应的一个Key值
    // 当前示例指的是module1 Module的SpecifiedAbility
    Logger.info(TAG, "MyAbilityStage onAcceptWant start" + JSON.stringify(want))
    if (want.abilityName === 'SpecifiedAbility') {
      // 返回的字符串Key标识为自定义拼接的字符串内容
      if (want.parameters) {
        return `SpecifiedAbilityInstance_${want.parameters.myInstanceKey}`;
      }
    }

    return '';
  }


  onMemoryLevel(level: AbilityConstant.MemoryLevel) {

  }
}