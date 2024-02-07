/**
 * 所有模块都可以使用的样式常量
 */
export default class CommonConstants {

  /**
   * 全宽或全高。
   */
  static readonly FULL_LENGTH: string = '100%';

  /**
   * 标题高度。
   */
  static readonly TITLE_WIDTH: string = '80%';

  /**
   * 列表默认宽度
   */
  static readonly LIST_DEFAULT_WIDTH: string = '93.3%';

  /**
   * 默认不透明度。
   */
  static readonly OPACITY_DEFAULT: number = 1;

  /**
   * 完成的不透明度
   */
  static readonly OPACITY_COMPLETED: number = 0.4;

  /**
   * 列表项的边框半径。
   */
  static readonly BORDER_RADIUS: number = 24;

  /**
   * 列表项的字体权重
   */
  static readonly FONT_WEIGHT: number = 500;

  /**
   * 列的空间
   */
  static readonly COLUMN_SPACE: number = 16;

  /**
   * 代理数据。
   */
  static readonly TODO_DATA: Array<string> = [
    "早起晨练",
    "准备早餐",
    "阅读名著",
    "学习ArkTS",
    "看剧放松"
  ]
}