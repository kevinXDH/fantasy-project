package com.jay.fantasy.controller;

import com.jay.fantasy.common.Response;
import com.jay.fantasy.entity.UserStar;
import com.jay.fantasy.service.UserStarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("userStar")
public class UserStarController {
    @Autowired
    private UserStarService userStarService;

    @PostMapping
    public Response<String> collect(@RequestBody UserStar userStar){
        userStarService.save(userStar);
        return Response.success("收藏成功");
    }

    @GetMapping("collectList")
    public Response<List<Integer>> getCollectListByUid(Integer uid){
//        System.err.println(uid);
        List<Integer> list = userStarService.getCollectListByUid(uid);
        return Response.success(list);
    }
}
