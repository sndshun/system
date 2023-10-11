package com.grays2.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.grays2.system.config.ResultCode;
import com.grays2.system.entity.UserAuthsEntity;
import com.grays2.system.entity.UsersEntity;
import com.grays2.system.jwt.JwtUtil;
import com.grays2.system.pojo.body.AdminUserLoginBody;
import com.grays2.system.pojo.dto.UserAuthorizationInfoDto;
import com.grays2.system.service.UserAuthsService;
import com.grays2.system.service.UsersService;
import com.grays2.system.tools.R;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 用户登录控制器
 *
 * @Author sndshun
 * @Date 2023/9/27 8:15
 * @Version 1.0
 * @Description: TODO
 */
@RestController
public class LoginController {
    @Resource
    private UsersService usersService;
    @Resource
    private UserAuthsService userAuthsService;


    /**
     * 根据邮箱或账号登录
     *
     * @param loginBody 登录正文
     * @return 用户信息
     */
    @RequestMapping("login")
    public R<?> login(@RequestBody @Valid AdminUserLoginBody loginBody) {

        LambdaQueryWrapper<UserAuthsEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(UserAuthsEntity::getIdentifier, loginBody.getUsername())
                .eq(UserAuthsEntity::getCredential, loginBody.getPassword());

        UserAuthsEntity userAuthsEntity = userAuthsService.getOne(lambdaQueryWrapper);
        if (null == userAuthsEntity) {
            return R.error(ResultCode.USER_LOGIN_ERROR);
        }
        UsersEntity usersEntity = usersService.getById(userAuthsEntity.getUserId());
        if (null == usersEntity || usersEntity.getIsEnable() == 0) {
            return R.error(ResultCode.USER_ACCOUNT_FORBIDDEN);
        }

        String token = JwtUtil.sign(usersEntity.getUserId(), loginBody.getUsername(), loginBody.getPassword());
        UserAuthorizationInfoDto userAuthorizationInfoDto=new UserAuthorizationInfoDto();
        BeanUtils.copyProperties(usersEntity,userAuthorizationInfoDto);
        userAuthorizationInfoDto.setToken(token);

        // redis
        usersService.setUserAuthorizationInfo(userAuthorizationInfoDto.getUserId(), userAuthorizationInfoDto);

        return R.ok(userAuthorizationInfoDto);
    }
}
