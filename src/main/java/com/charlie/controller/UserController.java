package com.charlie.controller;

import com.charlie.common.GenericController;
import com.charlie.dao.mapper.UserMapper;
import com.charlie.entity.User;
import com.charlie.service.UserService;
import com.charlie.util.ErrorEnum;
import com.charlie.util.ParamMap;
import com.charlie.util.Response;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.naming.Name;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController extends GenericController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;

//    //返回jsp视图展示
//    @RequestMapping(value = "/getUserModel",method = RequestMethod.GET)
//    public ModelAndView getUsers1(@RequestParam Integer userId) {
//        ModelAndView modelAndView = new ModelAndView();
//        //调用service方法得到用户列表
//        List<User> users = userService.getUsers(userId);
//        //将得到的用户列表内容添加到ModelAndView中
//        modelAndView.addObject("users",users);
//        //设置响应的jsp视图
//        modelAndView.setViewName("getUsers");
//        logger.info("===============================成功查询用户列表！");
//        return modelAndView;
//    }
//    //返回json格式数据，形式1
//    @RequestMapping(value = "/getUserJson1",method = RequestMethod.GET)
//    @ResponseBody
//    public List getUsers2(@RequestParam Integer userId, HttpServletRequest request, HttpServletResponse response) {
//        //调用service方法得到用户列表
//        List<User> users = userService.getUsers(userId);
//        logger.info("===============================成功查询用户列表！");
//        return users;
//    }
//    //返回json格式数据，形式2（自定义了返回的格式）
//    @RequestMapping(value = "/getUserJson2",method = RequestMethod.GET)
//    public void getUsers3(@RequestParam Integer userId, HttpServletRequest request, HttpServletResponse response) {
//        //调用service方法得到用户列表
//        List<User> users = userService.getUsers(userId);
//        logger.info("===============================成功查询用户列表！");
//        renderSuccessString(response, users);
//    }

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Response getUsers3(User u) {
        Response response = Response.newResponse();

        //调用service方法得到用户列表
        ParamMap paramMap = ParamMap.init();
        paramMap.add("name", u.getName());
        paramMap.add("password", u.getPassword());

        System.out.println(new Gson().toJson(paramMap));
        System.out.println(new Gson().toJson(u));
        User user = userMapper.get(paramMap);
        if (user != null) {
            return response.setError(ErrorEnum.SUCCESS);
        }else{
            return response.setError(ErrorEnum.PARAM_ERROR).setMessage("密码错误");
        }
    }
}
