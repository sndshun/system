package com.grays2.system.shiro;

import com.grays2.system.config.SystemConfig;
import com.grays2.system.jwt.JwtToken;
import com.grays2.system.jwt.JwtUtil;
import com.grays2.system.pojo.dto.UserAuthorizationInfoDto;
import com.grays2.system.service.UsersService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.concurrent.TimeUnit;

/**
 * 认证授权管理
 *
 * @Author sndshun
 * @Date 2023/9/27 11:09
 * @Version 1.0
 * @Description: TODO
 */
@Component
@Slf4j
public class UserRealm extends AuthorizingRealm {

    @Resource
    @Lazy  //懒加载解决 is not eligible for getting processed by all BeanPostProcessors (for example: not eligible for auto-proxying)
    private UsersService usersService;


    /**
     * 设置对应的token类型
     * 必须重写此方法，不然Shiro会报错
     *
     * @param token 令牌
     * @return boolean
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    /**
     * 授权认证
     *
     * @param principalCollection 主要收集
     * @return {@link AuthorizationInfo}
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取用户名
        String token = (String) SecurityUtils.getSubject().getPrincipal();
        Integer userId = JwtUtil.getUserId(token);
        String username = JwtUtil.getUsername(token);
        //todo 模拟数据库校验,写死用户名xsy，其他用户无法登陆成功
        if (!"admin".equals(username)) {
            return null;
        }
        //创建授权信息
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //创建set集合，存储权限
        HashSet<String> rootSet = new HashSet<>();
        //添加权限
        rootSet.add("user:show");
        rootSet.add("user:admin");
        //设置权限
        info.setStringPermissions(rootSet);
        //返回权限实例
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //获取token
        String token = (String) authenticationToken.getCredentials();
        //创建字符串，存储用户信息
        String username = null;
        Integer userId = null;
        try {
            //获取用户信息
            userId = JwtUtil.getUserId(token);
            username = JwtUtil.getUsername(token);
        } catch (AuthenticationException e) {
            throw new AuthenticationException("token错误或者为空");
        }
        if (username == null) {
            throw new AuthenticationException("token无效");
        }
        // 校验token是否超时失效 & 或者账号密码是否错误
        if (!jwtTokenRefresh(token, userId, username, SystemConfig.jwtSecret)) {
            throw new AuthenticationException("Token失效，请重新登录!");
        }
        //返回身份认证信息
        return new SimpleAuthenticationInfo(token, token, getName());
    }

    /**
     * jwt刷新令牌
     *
     * @param token    令牌
     * @param userId   用户Id
     * @param userName 用户名
     * @param passWord 通过单词
     * @return boolean
     */
    public boolean jwtTokenRefresh(String token, Integer userId, String userName, String passWord) {
        UserAuthorizationInfoDto userAuthorizationInfo = usersService.getUserAuthorizationInfo(userId);
        if (userAuthorizationInfo != null) {
            if (!JwtUtil.verify(token, userId, userName, passWord)) {
                String newToken = JwtUtil.sign(userId, userName, passWord);
                //设置redis缓存
                userAuthorizationInfo.setToken(newToken);
                usersService.setUserAuthorizationInfo(userId, userAuthorizationInfo);
            }
            return true;
        }
        return false;
    }
}
