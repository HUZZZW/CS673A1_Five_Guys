package com.tulingxueyuan.mall.modules.ums.dto;

import com.tulingxueyuan.mall.modules.ums.model.UmsMenu;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Back-end menu node encapsulation
 * Created by macro on 2020/2/4.
 */
@Getter
@Setter
public class UmsMenuNode extends UmsMenu {
    @ApiModelProperty(value = "sublevel menu")
    private List<UmsMenuNode> children;
}
