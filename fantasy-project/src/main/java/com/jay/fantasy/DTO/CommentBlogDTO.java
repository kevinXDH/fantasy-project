package com.jay.fantasy.DTO;

import com.jay.fantasy.entity.CommentBlog;
import com.jay.fantasy.entity.CommentResource;
import com.jay.fantasy.entity.User;
import lombok.Data;

@Data
public class CommentBlogDTO extends CommentBlog {
    private User user;
}
