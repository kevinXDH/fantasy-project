package com.jay.fantasy.controller;

import com.jay.fantasy.DTO.CommentBlogDTO;
import com.jay.fantasy.DTO.CommentResourceDTO;
import com.jay.fantasy.common.Response;
import com.jay.fantasy.entity.CommentBlog;
import com.jay.fantasy.service.CommentBlogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("commentBlog")
@Api(tags = "博客-评论模块接口")
public class CommentBlogController {
    @Autowired
    private CommentBlogService commentBlogService;

    @PostMapping("/save")
    @ApiOperation(value = "发表评论")
    public Response<String> save(@RequestBody CommentBlog commentBlog) {
        commentBlogService.save(commentBlog);
        return Response.success("评论发表成功");
    }

    @GetMapping("/getListByBid")
    @ApiOperation(value = "根据博客id查询所有评论")
    public Response<List<CommentBlogDTO>> getListByRid(Integer bid) {
        List<CommentBlogDTO> commentBlogDTOList = commentBlogService.getListByBid(bid);
        return Response.success(commentBlogDTOList);
    }
}
