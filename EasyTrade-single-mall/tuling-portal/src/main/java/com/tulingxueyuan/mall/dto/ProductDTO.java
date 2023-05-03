package com.tulingxueyuan.mall.dto;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "商品的数据传输对象", description = "商品的数据传输对象")
public class ProductDTO {
    private Long id;
    private String name;
    private String pic;

    @ApiModelProperty(value = "副标题")
    private String subTitle;

    @ApiModelProperty(value = "价格")
    private BigDecimal price;

    @ApiModelProperty(value = "市场价")
    private BigDecimal originalPrice;

    @ApiModelProperty(value = "控制价格是否加上‘起’，1为加， 0为不加")
    private Integer sub;
}
