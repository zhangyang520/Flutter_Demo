import "package:flutter/material.dart";
import  "dart:ui";

/**
 * @Description:
 * @Author:          sun
 * @CreateDate:     2019/4/15 17:33
 * @UpdateUser:     sun
 * @UpdateDate:    2019/4/15 17:33
 * @UpdateRemark:   修改内容
 * @Version:        1.0
 * @email           13520335872@163.com
 */
class Adapt{

    //媒体类
    static var mediaQuery=MediaQueryData.fromWindow(window);
    //宽度
    static var _width=mediaQuery.size.width;
    //高度
    static var _height=mediaQuery.size.height;
    //顶部的状态栏的高度
    static var _topbarH=mediaQuery.padding.top;
    //底部的工具栏的高度
    static var _botbarH=mediaQuery.padding.bottom;
    //密度
    static var _pixelRatio=mediaQuery.devicePixelRatio;

    //密度的比例
    static var _ratio;

    /**
     * 初始化 函数
     */
    static init(int number){
      //ui的 宽度
       var uiwidth=number is int ? number:750;
       //获取宽度的比例
       _ratio=_width/uiwidth;
    }

    /**
     * 返回对应的屏幕的px
     */
    static px(number) {
       if(!(_ratio is double || _ratio is int)){
          Adapt.init(750);
       }
       return number*_ratio;
    }

    /**
     * 1px
     */
    static onepx(){
       return 1/_pixelRatio;
    }

    /**
     * 实际设备的屏幕的宽度
     */
    static screenW(){
       return _width;
    }

    /**
     * 获取设备的高度
     */
    static screenH(){
      return _height;
    }

    /**
     * 返回状态栏的高度
     */
    static padTopH(){
      return _topbarH;
    }

    /**
     * 返回虚拟键的高度
     */
    static padBotH(){
       return _botbarH;
    }
}