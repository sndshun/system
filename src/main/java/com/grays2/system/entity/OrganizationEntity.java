package com.grays2.system.entity;


import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 组织表（有上下级关系）(Organization)表实体类
 *
 * @author sndshun
 * @since 2023-09-26 04:19:12
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrganizationEntity extends Model<OrganizationEntity> {
    /**
     * 组织ID
     */
    @TableId
    private Integer orgId;
    /**
     * 组织名称
     */

    private String orgName;
    /**
     * 组织类型（1：总公司 2：分公司 3：部门）
     */

    private Integer orgType;
    /**
     * 组织编码
     */

    private String orgCode;
    /**
     * 上级组织ID
     */

    private Integer parentId;
    /**
     * 节点位置，越小越靠前
     */

    private Integer sort;
    /**
     * 字体图标
     */

    private String icon;
    /**
     * 是否是超级管理员节点（1 是 0 不是）
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
        return this.orgId;
    }
}
