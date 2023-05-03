package com.tulingxueyuan.mall.dto;

import com.tulingxueyuan.mall.modules.sms.model.SmsHomeAdvertise;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.List;


@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "首页的类型导航栏和横幅组合数据传输对象", description = "首页的类型导航栏和横幅组合数据传输对象")
public class HomeMenusBannerDTO {

    private List<HomeMenusDTO> homeMenusList;
    private List<SmsHomeAdvertise> homeAdvertiseList;
}
