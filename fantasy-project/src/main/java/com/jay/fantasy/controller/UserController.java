package com.jay.fantasy.controller;

import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.jay.fantasy.DTO.UserDTO;
import com.jay.fantasy.common.Response;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.service.UserService;
import com.jay.fantasy.utils.jwt.JwtUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@RestController
@RequestMapping("user")
@Api(tags = "用户模块接口")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("verifyToken")
    @ApiOperation(value = "验证token")
    public Response<String> verifyToken() {
        return Response.success("验证通过");
    }

    @PostMapping("login")
    @ApiOperation(value = "用户登录")
    public Response<String> login(@RequestBody User user) {
        if (StringUtils.hasText(user.getUsername()) && StringUtils.hasText(user.getPassword())) {
            String username = user.getUsername();
            String password = user.getPassword();
            User userInfo = userService.getByUserNameAndPassword(username, password);
            if (userInfo == null) {
                return Response.error("用户名或密码错误");
            } else {
                userInfo.setPassword(null);
                String token = JwtUtil.getToken(userInfo, Calendar.DATE, 1);
                return new Response<String>().
                        add("token", token).
                        add("userInfo", userInfo.getId()).
                        add("code", 20000).
                        add("msg", "登录成功");
            }
        } else {
            return Response.error("用户名或密码不能为空");
        }
    }

    @PostMapping("/save")
    @ApiOperation(value = "用户注册")
    public Response<String> save(@RequestBody User user) {
        if (StringUtils.hasText(user.getUsername()) && StringUtils.hasText(user.getPassword())) {
            String username = user.getUsername();
            LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(User::getUsername, username);
            User userInfo = userService.getOne(queryWrapper);
            if (userInfo != null) {
                return Response.error("用户名已存在");
            } else {
                user.setName(UUID.randomUUID().toString().substring(0, 13));
                userService.save(user);
                return Response.success("注册成功");
            }
        } else {
            return Response.error("用户名或密码不能为空");
        }
    }

    @GetMapping("logout/{id}")
    @ApiOperation(value = "用户退出登录")
    public Response<String> logout(@PathVariable("id") Integer id) {
        if (id != null) {
            return Response.success("退出登录成功");
        } else {
            return Response.error("参数不能为空");
        }
    }

    @GetMapping("getSortList")
    @ApiOperation(value = "获得分享榜")
    public Response<List<UserDTO>> getSortList() {
        List<UserDTO> sortList = userService.getSortList();
        return Response.success(sortList);
    }

    @GetMapping
    @ApiOperation(value = "根据id查询用户")
    public Response<User> getById(Integer id) {
        User user = userService.getById(id);
        return Response.success(user);
    }

    @PostMapping
    @ApiOperation(value = "根据id修改用户")
    public Response<String> updateById(@RequestBody User user) {
        if (user.getAvatar() == null) {
            userService.updateById(user);
            return Response.success("修改个人信息成功");
        } else {
            userService.updateById(user);
            return Response.success("修改头像成功");
        }
    }
}
