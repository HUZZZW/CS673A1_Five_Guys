package com.tulingxueyuan.mall.modules.ums.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * Membership scale
 * </p>
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_member_level")
@ApiModel(value="UmsMemberLevel object", description="membership scale")
public class UmsMemberLevel implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String name;

    private Integer growthPoint;

    @ApiModelProperty(value = "default level: 0-> No; 1-> Yes")
    private Integer defaultStatus;

    @ApiModelProperty(value = "free freight standard")
    private BigDecimal freeFreightPoint;

    @ApiModelProperty(value = "the growth value obtained from each evaluation")
    private Integer commentGrowthPoint;

    @ApiModelProperty(value = "do you have free shipping privileges")
    private Integer priviledgeFreeFreight;

    @ApiModelProperty(value = "whether there are check-in privileges")
    private Integer priviledgeSignIn;

    @ApiModelProperty(value = "whether any comments have been rewarded with privilege")
    private Integer priviledgeComment;

    @ApiModelProperty(value = "whether there are exclusive event privileges")
    private Integer priviledgePromotion;

    @ApiModelProperty(value = "whether there is a member price privilege")
    private Integer priviledgeMemberPrice;

    @ApiModelProperty(value = "whether there are birthday privileges")
    private Integer priviledgeBirthday;

    private String note;


}
