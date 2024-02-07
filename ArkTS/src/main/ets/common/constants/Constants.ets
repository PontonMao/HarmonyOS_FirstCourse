
// 公共常量类

/**
 * 应用程序的字体大小。
 */
export enum FontSize {
  SMALL = 14,
  MIDDLE = 16,
  LARGE = 20,
}

/**
 * 应用程序的字体权重。
 */
export enum FontWeight {
  BOLD = '400',
  BOLDER = '500',
}

/**
 * 这个权重是组件大小的全局默认值
 */
export const WEIGHT = '100%';

/**
 * 标题组件的标题
 */
export const TITLE: Resource = $r('app.string.title');

/**
 * 退出的间隔时间。
 */
export const APP_EXIT_INTERVAL: number = 4500;

/**
 * 吐司的持续时间。
 */
export const TIME = 1000;

class titleBarStyle {
  IMAGE_BACK_SIZE: number = 21;
  IMAGE_BACK_MARGIN_RIGHT: number = 18;
  IMAGE_LOADING_SIZE: number = 22;
  BAR_HEIGHT: number = 47;
  BAR_MARGIN_HORIZONTAL: number = 26;
  BAR_MARGIN_TOP: number = 10;
  WEIGHT: string = '50%';
}

/**
 * 标题组件样式
 */
export const TitleBarStyle: titleBarStyle = {
  /**
   * 返回按钮图片的大小。
   */
  IMAGE_BACK_SIZE: 21,
  /**
   * 返回按钮的右边距。
   */
  IMAGE_BACK_MARGIN_RIGHT: 18,
  /**
   * 加载图片的大小。
   */
  IMAGE_LOADING_SIZE: 22,
  /**
   * 标题组件的高度。
   */
  BAR_HEIGHT: 47,
  /**
   * 标题组件的的水平边距。
   */
  BAR_MARGIN_HORIZONTAL: 26,
  /**
   * 标题组件的上边距。
   */
  BAR_MARGIN_TOP: 10,
  /**
   * 行布局的权重。
   */
  WEIGHT: '50%',
}

class listHeaderStyle {
  FONT_WEIGHT: number = 400;
  LAYOUT_WEIGHT_LEFT: string = '30%';
  LAYOUT_WEIGHT_CENTER: string = '50%';
  LAYOUT_WEIGHT_RIGHT: string = '20%';
}

/**
 * 列表头部组件的样式
 */
export const ListHeaderStyle: listHeaderStyle = {
  /**
   * 字体权重
   */
  FONT_WEIGHT: 400,
  /**
   * 左侧的布局权重。
   */
  LAYOUT_WEIGHT_LEFT: '30%',
  /**
   * 中间的布局权重。
   */
  LAYOUT_WEIGHT_CENTER: '50%',
  /**
   * 右侧的布局权重。
   */
  LAYOUT_WEIGHT_RIGHT: '20%',
}

class itemStyle {
  TEXT_LAYOUT_SIZE: number = 24;
  CIRCLE_TEXT_BORDER_RADIUS: number = 24;
  CIRCLE_TEXT_SIZE: number = 24;
  CIRCLE_TEXT_COLOR_STOP_1: number = 0.5;
  CIRCLE_TEXT_COLOR_STOP_2: number = 1.0;
  BAR_HEIGHT: number = 48;
  LAYOUT_WEIGHT_LEFT: string = '30%';
  LAYOUT_WEIGHT_CENTER: string = '50%';
  LAYOUT_WEIGHT_RIGHT: string = '20%';
  BORDER_WIDTH: number = 1;
  COLOR_BLUE: Resource = $r('app.color.item_color');
  COLOR_BLACK:Resource = $r('app.color.item_color_black');
}

/**
 * 列表项组件的样式
 */
export const ItemStyle: itemStyle = {
  /**
   * 文本的行高。
   */
  TEXT_LAYOUT_SIZE: 24,
  /**
   * 圆型文本的边框半径。
   */
  CIRCLE_TEXT_BORDER_RADIUS: 24,
  /**
   * 圆型文本的大小。
   */
  CIRCLE_TEXT_SIZE: 24,
  /**
   * 渐变色比例。
   */
  CIRCLE_TEXT_COLOR_STOP_1: 0.5,
  /**
   * 渐变色比例。
   */
  CIRCLE_TEXT_COLOR_STOP_2: 1.0,
  /**
   * 项目的高度。
   */
  BAR_HEIGHT: 48,
  /**
   * The layout weight of left.
   */
  LAYOUT_WEIGHT_LEFT: '30%',
  /**
   * 中间的布局权重。
   */
  LAYOUT_WEIGHT_CENTER: '50%',
  /**
   * 右侧的布局权重。
   */
  LAYOUT_WEIGHT_RIGHT: '20%',
  /**
   * 边框的宽度。
   */
  BORDER_WIDTH: 1,
  /**
   * 项目的蓝色。
   */
  COLOR_BLUE: $r('app.color.item_color'),
  /**
   * 项目的黑色。
   */
  COLOR_BLACK: $r('app.color.item_color_black')
}

class style {
  RANK_PADDING: number = 15;
  CONTENT_WIDTH: string = '90%';
  BORDER_RADIUS: number = 20;
  STROKE_WIDTH: number = 1;
  HEADER_MARGIN_TOP: number = 20;
  HEADER_MARGIN_BOTTOM: number = 15;
  LIST_HEIGHT: string = '65%';
}

/**
 * 排行榜页面的样式
 */
export const Style: style = {
  /**
   * 排行的内边距
   */
  RANK_PADDING:  15,
  /**
   * 排名内容的宽度。
   */
  CONTENT_WIDTH: '90%',
  /**
   * 边界半径。
   */
  BORDER_RADIUS: 20,
  /**
   * 分割线的描边宽度
   */
  STROKE_WIDTH: 1,
  /**
   * 排名头部的上边距。
   */
  HEADER_MARGIN_TOP: 20,
  /**
   * 排名头部的下边距。
   */
  HEADER_MARGIN_BOTTOM: 15,
  /**
   * 列表的高度
   */
  LIST_HEIGHT: '65%',
}

