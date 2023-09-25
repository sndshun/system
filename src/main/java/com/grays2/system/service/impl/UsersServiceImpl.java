package com.grays2.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.grays2.system.mapper.UsersMapper;
import com.grays2.system.entity.UsersEntity;
import com.grays2.system.service.UsersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
}
