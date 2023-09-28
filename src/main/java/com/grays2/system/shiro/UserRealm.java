package com.grays2.system.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;

/**
 * 认证授权管理
 * @Author sndshun
 * @Date 2023/9/27 11:09
 * @Version 1.0
 * @Description: TODO
 */
@Component
public class UserRealm extends AuthorizingRealm {

    /**
     * 获取身份验证信息
     *
     * @param authenticationToken 身份验证令牌
     * @return {@link AuthenticationInfo}
     * @throws AuthenticationException 身份验证异常
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        return null;
    }

    /**
     * 获取授权信息
     *
     * @param principalCollection 主体集合
     * @return {@link AuthorizationInfo}
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }
}
