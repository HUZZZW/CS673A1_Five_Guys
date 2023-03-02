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
 * Back-end user table
 * </p>
 *
 * @author macro
 * @since 2020-08-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_admin")
@ApiModel(value="UmsAdmin object", description="back-end user table")
public class UmsAdmin implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private String username;

    private String password;

    @ApiModelProperty(value = "head portrait")
    private String icon;

    @ApiModelProperty(value = "email")
    private String email;

    @ApiModelProperty(value = "nickname")
    private String nickName;

    @ApiModelProperty(value = "note")
    private String note;

    @ApiModelProperty(value = "creation time")
    private Date createTime;

    @ApiModelProperty(value = "private Date lastlogintime")
    private Date loginTime;

    @ApiModelProperty(value = "Account status: 0-> Disabled. 1-> Enable")
    private Integer status;


}
