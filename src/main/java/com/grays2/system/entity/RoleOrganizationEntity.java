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
 * 组织-角色-关联表(RoleOrganization)表实体类
 *
 * @author sndshun
 * @since 2023-09-27 06:27:47
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("role_organization")
public class RoleOrganizationEntity extends Model<RoleOrganizationEntity> {
    /**
     * 角色ID
     */

    @TableId
    private Integer roleId;
    /**
     * 组织ID
     */

    private Integer orgId;
    /**
     * 系统编码
     */

    private String sysCode;
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
