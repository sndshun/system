package com.grays2.system.pojo.body;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

/**
 * @Author sndshun
 * @Date 2023/9/27 8:20
 * @Version 1.0
 * @Description: 管理员登录表单接受
 */
@Data
public class AdminUserLoginBody {
    /**
     * 用户名
     */
    @NotBlank(message = "账号不能为空")
    @Length(min = 2,max = 20,message = "账号长度为2-20")
    private String username;
    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    @Length(min = 2,max = 20,message = "密码长度为2-20")
    private String password;
}
