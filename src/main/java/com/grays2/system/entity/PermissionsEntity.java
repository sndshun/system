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
 * 权限表(Permissions)表实体类
 *
 * @author sndshun
 * @since 2023-09-26 04:19:12
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PermissionsEntity extends Model<PermissionsEntity> {
    /**
     * 权限id
     */
    @TableId
    private Integer permissionId;
    /**
     * 权限名称
     */

    private String permissionName;
    /**
     * 权限编码
     */

    private String permissionCode;
    /**
     * 权限类型（1 菜单 2按钮 3数据）
     */

    private String permissionType;
    /**
     * 父权限id（如果没有父ID，则为-1）
     */

    private Integer parentId;
    /**
     * 节点位置，越小越靠前
     */

    private Integer sort;
    /**
     * 备注信息
     */

    private String remarks;
    /**
     * 节点链接
     */

    private String url;
    /**
     * 系统编码
     */

    private String sysCode;
    /**
     * 字体图标
     */

    private String icon;
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
        return this.permissionId;
    }
}
