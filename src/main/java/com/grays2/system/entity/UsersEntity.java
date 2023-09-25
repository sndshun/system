package com.grays2.system.entity;


import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户表(Users)表实体类
 *
 * @author sndshun
 * @since 2023-09-26 04:19:12
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsersEntity extends Model<UsersEntity> {
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
     * 用户密码
     */

    private String password;
    /**
     * 用户别名
     */

    private String userAlias;
    /**
     * 账号是否可用（1：可用  0：禁用）
     */

    private Integer isEnable;
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
     * 逻辑删除（0：正常 1：删除）
     */

    private Integer isDelete;
    /**
     * 创建用户
     */

    private Integer createUser;
    /**
     * 更新用户
     */

    private Integer updateUser;
    /**
     * 创建时间
     */

    private Date createTime;
    /**
     * 更新时间
     */

    private Date updateTime;


    /**
     * 获取主键值
     *
     * @return 主键值
     */
    @Override
    public Serializable pkVal() {
        return this.userId;
    }
}
