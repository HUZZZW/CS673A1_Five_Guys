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
 * Back-end resource table
 * </p>
 *
 * @author macro
 * @since 2020-08-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_resource")
@ApiModel(value="UmsResource object", description="back-end resource table")
public class UmsResource implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "creation time")
    private Date createTime;

    @ApiModelProperty(value = "resource name")
    private String name;

    @ApiModelProperty(value = "resource URL")
    private String url;

    @ApiModelProperty(value = "description")
    private String description;

    @ApiModelProperty(value = "resource classification ID")
    private Long categoryId;


}
