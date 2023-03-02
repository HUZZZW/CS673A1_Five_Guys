package com.tulingxueyuan.mall.modules.ums.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * Back-end menu table
 * </p>
 *
 * @author macro
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_menu")
@ApiModel(value="UmsMenu object", description="back-end menu table")
public class UmsMenu implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "Parent ID")
    private Long parentId;

    @ApiModelProperty(value = "creation time")
    private Date createTime;

    @ApiModelProperty(value = "menu name")
    private String title;

    @ApiModelProperty(value = "menu progression")
    private Integer level;

    @ApiModelProperty(value = "menu sorting")
    private Integer sort;

    @ApiModelProperty(value = "front-end name")
    private String name;

    @ApiModelProperty(value = "front-end icon")
    private String icon;

    @ApiModelProperty(value = "front-end hiding")
    private Integer hidden;


}
