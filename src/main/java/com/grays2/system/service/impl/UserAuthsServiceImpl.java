package com.grays2.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grays2.system.mapper.UserAuthsMapper;
import com.grays2.system.entity.UserAuthsEntity;
import com.grays2.system.service.UserAuthsService;
import org.springframework.stereotype.Service;

/**
 * 用户授权表(UserAuths)表服务实现类
 *
 * @author sndshun
 * @since 2023-09-27 10:39:47
 */
@Service("userAuthsService")
public class UserAuthsServiceImpl extends ServiceImpl<UserAuthsMapper, UserAuthsEntity> implements UserAuthsService {

}
