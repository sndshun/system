package com.grays2.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.grays2.system.entity.UsersEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resources;

/**
 * 用户表(Users)表数据库访问层
 *
 * @author sndshun
 * @since 2023-09-26 04:19:12
 */
public interface UsersMapper extends BaseMapper<UsersEntity> {

}
