package com.grays2.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.grays2.system.entity.UsersEntity;
import com.grays2.system.pojo.dto.UserAuthorizationInfoDto;

/**
 * 用户表(Users)表服务接口
 *
 * @author sndshun
 * @since 2023-09-26 04:29:11
 */
public interface UsersService extends IService<UsersEntity> {

    /**
     * 设置用户授权信息-redis
     *
     * @param userId 用户标识
     * @param dto    载体
     * @return boolean
     */
    public boolean setUserAuthorizationInfo(Integer userId, UserAuthorizationInfoDto dto);

    /**
     * 获取用户授权信息-redis
     *
     * @param userId 用户标识
     * @return {@link UserAuthorizationInfoDto}
     */
    public UserAuthorizationInfoDto getUserAuthorizationInfo(Integer userId);

}
