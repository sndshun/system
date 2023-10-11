package com.grays2.system.pojo.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户登录后获取的认证信息
 * @Author sndshun
 * @Date 2023/10/9 20:32
 * @Version 1.0
 * @Description: TODO
 */
@Data
public class UserAuthorizationInfoDto implements Serializable {
    /**
     * 用户id
     */

    @TableId
    private Integer userId;
    /**
     * 用户名
     */

    private String username;
    /**
     * 用户别名
     */

    private String userAlias;
    /**
     * 性别（0：女 1：男）
     */

    private Integer sex;
    /**
     * 手机号
     */

    private String cellPhoneNumber;
    /**
     * 住址
     */

    private String address;
    /**
     * 登录日期
     */

    private String entryDate;
    /**
     * 上次登录日期
     */

    private String lastLogin;
    /**
     * 电子邮件
     */

    private String email;
    /**
     * 是否超级管理员（0：否  1：是）
     */

    private Integer isSuper;
    /**
     * 备注信息
     */

    private String remarks;
    /**
     * token
     */
    private String token;

}
