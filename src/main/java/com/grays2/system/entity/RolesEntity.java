package com.grays2.system.entity;


import java.util.Date;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableId;

/**
 * 角色表(Roles)表实体类
 *
 * @author sndshun
 * @since 2023-09-27 06:27:47
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("roles")
public class RolesEntity extends Model<RolesEntity> {
    /**
     * 角色id
     */

    @TableId
    private Integer roleId;
    /**
     * 角色名称
     */

    private String roleName;
    /**
     * 角色编码
     */

    private String roleCode;
    /**
     * 父角色id（如果没有父ID，则为-1）
     */

    private Integer parentId;
    /**
     * 节点位置（超级管理员：0，其他角色最小为1）
     */

    private Integer sort;
    /**
     * 备注信息
     */

    private String remarks;
    /**
     * 系统编码
     */

    private String sysCode;
    /**
     * 字体图标
     */

    private String icon;
    /**
     * 是否是超级角色（1 是 0 不是 2 基础角色）
     */

    private Integer isSuper;
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
        return this.roleId;
    }
}
