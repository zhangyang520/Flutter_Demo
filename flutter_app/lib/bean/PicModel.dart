import 'package:json_annotation/json_annotation.dart';
//part 'picmodel.g.dart';

/**
 * @Description:    请求实体
 * @Author:          sun
 * @CreateDate:     2019/4/16 10:38
 * @UpdateUser:     sun
 * @UpdateDate:    2019/4/16 10:38
 * @UpdateRemark:   修改内容
 * @Version:        1.0
 * @email           13520335872@163.com
 */
@JsonSerializable()
class PicModel{
     PicModel(this.createdAt,this.publishedAt,this.type,this.url);

     /**
      * 四个属性
      */
     String createdAt;
     String publishedAt;
     String type;
     String url;

     /**
      * 将 map 集合 转换成 实体
      */
     PicModel.fromJson(Map<String,dynamic> json){
         createdAt=json["createdAt"];
         publishedAt=json["publishedAt"];
         type=json["type"];
         url=json["url"];
     }

     /**
      * 转换 json的格式
      */
     Map<String,dynamic> toJson()=>{
        'createdAt':createdAt,
         'publishedAt':publishedAt,
         'type':type,
          'url':url,
     };
}