package com.jay.fantasy.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.jay.fantasy.DTO.CommentResourceDTO;
import com.jay.fantasy.common.Response;
import com.jay.fantasy.entity.Blog;
import com.jay.fantasy.entity.CommentResource;
import com.jay.fantasy.entity.User;
import com.jay.fantasy.service.CommentResourceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("commentResource")
@Api(tags = "资源-评论模块接口")
public class CommentResourceController {
    @Autowired
    private CommentResourceService commentResourceService;

    @PostMapping("/save")
    @ApiOperation(value = "发表评论")
    public Response<String> save(@RequestBody CommentResource commentResource) {
        commentResourceService.save(commentResource);
        return Response.success("评论发表成功");
    }

    @GetMapping("/getListByRid")
    @ApiOperation(value = "根据资源id查询所有评论")
    public Response<List<CommentResourceDTO>> getListByRid(Integer rid) {
        List<CommentResourceDTO> commentResourceDTOList = commentResourceService.getListByRid(rid);
        return Response.success(commentResourceDTOList);
    }

    @GetMapping("/getAllComment")
    @ApiOperation(value = "查询所有评论")
    public Response<List<CommentResourceDTO>> getAllComment() {
        List<CommentResourceDTO> commentResourceDTOList = commentResourceService.getAllComment();
        return Response.success(commentResourceDTOList);
    }

    @DeleteMapping
    @ApiOperation(value = "根据id删除评论")
    public Response<String> deleteById(Integer id) {
        commentResourceService.removeById(id);
        return Response.success("删除评论成功");
    }
}
