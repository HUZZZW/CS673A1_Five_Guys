package com.tulingxueyuan.mall.modules.ums.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

/**
 * User login parameter
 * Created by macro on 2018/4/26.
 */
@Getter
@Setter
public class UmsAdminParam {
    @NotEmpty
    @ApiModelProperty(value = "username", required = true)
    private String username;
    @NotEmpty
    @ApiModelProperty(value = "password", required = true)
    private String password;
    @ApiModelProperty(value = "user avatar")
    private String icon;
    @Email
    @ApiModelProperty(value = "email")
    private String email;
    @ApiModelProperty(value = "user nickname")
    private String nickName;
    @ApiModelProperty(value = "remark")
    private String note;
}
