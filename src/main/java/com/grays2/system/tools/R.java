package com.grays2.system.tools;

import java.io.Serializable;

import com.grays2.system.config.ResultCode;
import lombok.Getter;
import lombok.Setter;

/**
 * 统一响应返回体
 * @author sndshun
 * @since 2023-09-26 03:36:21
 */
@Getter
@Setter
public class R<T> implements Serializable {
   private static final long serialVersionUID = 1L;
   private Integer code;
   private String message;
   private T data;

   private R() {
   }

   private R(Integer code, String message, T data) {
      this.code = code;
      this.message = message;
      this.data = data;
   }

   /**
    * 成功
    * @param data
    * @param <T>
    * @return
    */
   public static<T> R<T> ok(T data){
      R<T> r = new R<T>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMsg(),data);
      return r;
   }

   /**
    * 成功返回自定义信息
    * @param resultCode
    * @param data
    * @param <T>
    * @return
    */
   public static<T> R<T> ok(ResultCode resultCode,T data){
      R<T> r = new R<T>(resultCode.getCode(),resultCode.getMsg(),data);
      return r;
   }
   /**
    * 返回错误
    * @param resultCode
    * @return
    */
   public static R error(ResultCode resultCode){
      R r = new R();
      r.setCode(resultCode.getCode());
      r.setMessage(resultCode.getMsg());
      return r;
   }
   public static R error(ResultCode resultCode,String message){
      R r = new R();
      r.setCode(resultCode.getCode());
      r.setMessage(message);
      return r;
   }
   /**
    * 自定义异常信息
    * @param msg
    * @return
    */
   public static R error(String msg){
      R r = new R();
      r.setCode(ResultCode.FAIL.getCode());
      r.setMessage(msg);
      return r;
   }
   //链式编程   R.result().data(..).code(..)
   public static <T> R<T> result(){
      return new R<T>();
   }
   public R code(Integer code){
      this.code = code;
      return this;
   }

   public R message(String msg) {
      this.message = msg;
      return this;
   }
   public R<T> data(T data) {
      this.data = data;
      return this;
   }
}
