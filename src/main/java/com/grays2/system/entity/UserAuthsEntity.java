package com.grays2.system.entity;


import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户授权表(UserAuths)表实体类
 *
 * @author sndshun
 * @since 2023-09-26 04:19:12
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAuthsEntity extends Model<UserAuthsEntity> {

    @TableId
    private Integer id;
    /**
     * 用户id
     */

    private Integer userId;
    /**
     * 登录类型（手机号 邮箱 用户名）或第三方应用名称（微信 微博等）
     */

    private String identityType;
    /**
     * 标识（手机号 邮箱 用户名或第三方应用的唯一标识）
     */

    private String identifier;
    /**
     * 密码凭证（站内的保存密码，站外的不保存或保存token）
     */

    private String credential;
    /**
     * 更新时间
     */

    private Date updateTime;
    /**
     * 创建时间
     */

    private Date createTime;


    /**
     * 获取主键值
     *
     * @return 主键值
     */
    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
