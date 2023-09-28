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
 * 跨权限映射表(CrossPermission)表实体类
 *
 * @author sndshun
 * @since 2023-09-27 06:27:46
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("cross_permission")
public class CrossPermissionEntity extends Model<CrossPermissionEntity> {
    /**
     * 跨权限者的ID
     */

    @TableId
    private Integer crossId;
    /**
     * 被跨越的权限ID
     */

    private Integer permissionId;
    /**
     * 1：用户 2：用户组 3：职位 4：组织
     */

    private Integer crossType;
    /**
     * 跨越者名称
     */

    private String crossName;
    /**
     * 被跨越权限名称
     */

    private String permissionName;
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
