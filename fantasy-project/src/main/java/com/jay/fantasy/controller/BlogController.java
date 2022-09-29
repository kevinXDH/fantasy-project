package com.jay.fantasy.controller;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.jay.fantasy.DTO.BlogDTO;
import com.jay.fantasy.DTO.ResourceDetailDTO;
import com.jay.fantasy.common.Response;
import com.jay.fantasy.entity.Blog;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.service.BlogService;
import com.jay.fantasy.service.EmailService;
import com.jay.fantasy.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("blog")
@Api(tags = "博客模块接口")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private UserService userService;

    @GetMapping("list")
    @ApiOperation(value = "分页查询博客列表")
    public Response<List<BlogDTO>> getList(int page,int pageSize) {
        List<BlogDTO> list = blogService.getList(page,pageSize);
        return Response.success(list);
    }

    @GetMapping
    @ApiOperation(value = "根据id查询")
    public Response<BlogDTO> getById(Integer id) {
        BlogDTO dto = blogService.getBlogById(id);
        return Response.success(dto);
    }

    @GetMapping("hotList")
    @ApiOperation(value = "查询热门博客列表")
    public Response<List<BlogDTO>> getHotList() {
        List<BlogDTO> list = blogService.getHotList();
        return Response.success(list);
    }

    @DeleteMapping
    @ApiOperation(value = "根据id删除")
    public Response<String> deleteById(Integer id) {
        blogService.removeById(id);
        return Response.success("删除博客成功");
    }

    @PutMapping
    @ApiOperation(value = "根据id修改blog")
    public Response<String> updateById(@RequestBody Blog blog) {
        blogService.updateById(blog);
        return Response.success("修改博客成功");
    }

    @PostMapping
    @ApiOperation(value = "审核blog")
    public Response<String> beforeSave(@RequestBody Blog blog) {
        ValueOperations<String,Blog> valueOperations = redisTemplate.opsForValue();
        blog.setCreateTime(LocalDateTime.now());
        valueOperations.set("jay_"+blog.getName(), blog);
        return Response.success("博客已提交，待管理员审核");
    }

    @PostMapping("save")
    @ApiOperation(value = "博客审核通过")
    public Response<String> save(@RequestBody Blog blog) {
        redisTemplate.delete("jay_" + blog.getName());
        Integer uid = blog.getUid();
        User user = userService.getById(uid);
        if (StringUtils.hasText(user.getEmail())){
            emailService.sendSimpleMail("2654153573@qq.com",user.getEmail(),"亲爱的"+user.getName(),"您的博客《"+blog.getName()+"》审核已通过");
        }
        blogService.save(blog);
        return Response.success("操作成功");
    }

    @PostMapping("deleteRedis")
    @ApiOperation(value = "博客审核不通过")
    public Response<String> delete(@RequestBody Blog blog) {
        redisTemplate.delete("jay_" + blog.getName());
        Integer uid = blog.getUid();
        User user = userService.getById(uid);
        if (StringUtils.hasText(user.getEmail())){
            emailService.sendSimpleMail("2654153573@qq.com",user.getEmail(),"亲爱的"+user.getName()+",","您的博客《"+blog.getName()+"》审核不通过，请修改后重新发布");
        }
        return Response.success("操作成功");
    }

    @GetMapping("getRedis")
    public Response<List<BlogDTO>> getRedis() {
        List<BlogDTO> list =new ArrayList<>();
        ValueOperations<String,Blog> valueOperations = redisTemplate.opsForValue();
        Set<String> keys = redisTemplate.keys("jay_*");
        for (String key : keys) {
            BlogDTO blogDTO = new BlogDTO();
            Blog blog = valueOperations.get(key);
            User user = userService.getById(blog.getUid());
            user.setUsername(null);
            user.setEmail(null);
            user.setPassword(null);
            user.setPhone(null);
            BeanUtils.copyProperties(blog,blogDTO);
            blogDTO.setUser(user);
            list.add(blogDTO);
        }
        return Response.success(list);
    }
}
