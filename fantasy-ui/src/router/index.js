import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/user/Login.vue'
import Home from '../views/Home.vue'
import ResourceDetail from "@/views/resource/ResourceDetail";
import Resource from "@/views/resource/Resource";
import UserDetail from "@/views/user/UserDetail";
import Blog from "@/views/blog/Blog";
import BlogDetail from "@/views/blog/BlogDetail";
import axios from 'axios'
import { Message } from 'element-ui';

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        redirect: '/home',
        meta: {
            title: 'Fantasy-首页'
        }
    },
    {
        path: '/home',
        component: Home,
        meta: {
            title: 'Fantasy-首页'
        }
    },
    {
        path: '/login/:type',
        component: Login,
        props: true,
        meta: {
            title: 'Fantasy-登录/注册'
        }
    },
    {
        path: '/resource/:id',
        component: ResourceDetail,
        props: true,
        meta: {
            title: 'Fantasy-资源详情'
        }
    },
    {
        path: '/resource',
        component: Resource,
        meta: {
            title: 'Fantasy-资源大全'
        }
    },
    {
        path: '/blog',
        component: Blog,
        meta: {
            title: 'Fantasy-博客列表'
        }
    },
    {
        path: '/blog/:id',
        component: BlogDetail,
        props: true,
        meta: {
            title: 'Fantasy-博客详情'
        }
    },
    {
        path: '/userDetail/:id',
        component: UserDetail,
        props: true,
        meta: {
            title: 'Fantasy-个人中心'
        },
    }
]

const router = new VueRouter({
    routes
})


router.beforeEach((to, from, next) => {
    window.document.title = to.meta.title === undefined ? 'Fantasy' : to.meta.title
    if (to.path.startsWith('/userDetail')||to.path.startsWith('/resource')||to.path.startsWith('/blog')) {
        let userInfo = window.localStorage.getItem('userInfo')
        if (!userInfo) {
            Message.info('请登录后再操作')
            next({path: '/login/0'})
        } else {
            let token = window.localStorage.getItem('token')
            if (!token) {
                Message.info('请登录后再操作')
                next({path: '/login/0'})
            } else {
                axios({
                    url: 'http://xxx.xxx.xxx.xxx:10086/user/verifyToken',
                    method: 'get',
                    headers: {
                        token
                    },
                }).then((response) => {
                    if (response.data.code===50000){
                        Message.info('身份验证失败')
                        next({path: '/login/0'})
                    }
                })
                next()
            }
        }
    }
    next()
})

export default router;
