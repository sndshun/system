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
 * 跨角色映射表(CrossRole)表实体类
 *
 * @author sndshun
 * @since 2023-09-26 04:19:12
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CrossRoleEntity extends Model<CrossRoleEntity> {
    /**
     * 跨角色者的ID
     */
    @TableId(type = IdType.INPUT)
    private Integer crossId;
    /**
     * 被跨越的角色ID
     */
    private Integer roleId;
    /**
     * 1：用户 2：用户组 3：职位 4：组织
     */

    private Integer crossType;
    /**
     * 跨角色者的名称
     */

    private String crossName;
    /**
     * 被跨越角色名称
     */

    private String roleName;
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
        return this.crossId;
    }
}
