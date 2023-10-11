package com.grays2.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grays2.system.config.SystemConfig;
import com.grays2.system.mapper.UsersMapper;
import com.grays2.system.entity.UsersEntity;
import com.grays2.system.pojo.dto.UserAuthorizationInfoDto;
import com.grays2.system.service.UsersService;
import com.grays2.system.tools.RedisKeyUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * 用户表(Users)表服务实现类
 *
 * @author sndshun
 * @since 2023-09-26 04:29:11
 */
@Service("usersService")
public class UsersServiceImpl extends ServiceImpl<UsersMapper, UsersEntity> implements UsersService {
    @Resource
    private UsersMapper usersMapper;
    @Resource
    private RedisTemplate redisTemplate;

    public boolean setUserAuthorizationInfo(Integer userId, UserAuthorizationInfoDto dto) {
        String key = RedisKeyUtil.getKey_("authorization", "users", "id", userId.toString());
        try {
            redisTemplate.opsForValue().set(key, dto, SystemConfig.tokenExpireTime,TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    public UserAuthorizationInfoDto getUserAuthorizationInfo(Integer userId) {
        String key = RedisKeyUtil.getKey_("authorization", "users", "id", userId.toString());
        UserAuthorizationInfoDto userAuthorizationInfoDto = (UserAuthorizationInfoDto) redisTemplate.opsForValue().get(key);
        return userAuthorizationInfoDto;
    }
}
