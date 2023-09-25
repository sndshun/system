package com.grays2.system.entity;


import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 职位表(Post)表实体类
 *
 * @author sndshun
 * @since 2023-09-26 04:19:12
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostEntity extends Model<PostEntity> {
    /**
     * 职位ID
     */
    @TableId
    private Integer postId;
    /**
     * 职位名称
     */

    private String postName;
    /**
     * 职位编码
     */

    private String postCode;
    /**
     * 上级职位ID
     */

    private Integer parentId;
    /**
     * 所属组织ID
     */

    private String orgId;
    /**
     * 字体图标
     */

    private String icon;
    /**
     * 节点位置，越小越靠前
     */

    private Integer sort;
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
        return this.postId;
    }
}
