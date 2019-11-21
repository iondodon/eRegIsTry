package com.utm.controllers;

import com.utm.editors.SubjectEditor;
import com.utm.entities.Subject;
import com.utm.entities.Teacher;
import com.utm.entities.User;
import com.utm.services.SubjectService;
import com.utm.services.TeacherService;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    private UserService userService;
    private TeacherService teacherService;
    private SubjectService subjectService;
    private SubjectEditor subjectEditor;

    @Autowired
    public void setSubjectEditor(SubjectEditor subjectEditor) {
        this.subjectEditor = subjectEditor;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Autowired
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Subject.class, this.subjectEditor);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateTeacherForm(Model model) {
        model.addAttribute("user", new User());
        return "teacher/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createTeacher(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if(!user.getPassword().equals(user.getPasswordConfirmation())) {
            bindingResult.rejectValue("passwordConfirmation", "password", "Passwords don't match.");
        }

        if(bindingResult.hasErrors()){
            ModelMap model = new ModelMap();
            model.addAttribute("user", user);
            return new ModelAndView("teacher/create", model);
        }

        Teacher teacher = this.teacherService.createTeacher(user);
        this.teacherService.saveTeacher(teacher);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateTeacherForm(HttpServletRequest request, Model model) {
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        Teacher teacher = this.teacherService.getTeacherById(teacherId);

        model.addAttribute("teacher", teacher);
        model.addAttribute("subjects", subjectService.getAllSubjects());

        return "teacher/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView updateTeacher(@Valid @ModelAttribute("teacher") Teacher teacher, BindingResult resultTeacher) {
        if(resultTeacher.hasErrors()) {
            ModelMap model = new ModelMap();
            model.addAttribute("teacher", teacher);
            model.addAttribute("subjects", subjectService.getAllSubjects());
            return new ModelAndView("teacher/update", model);
        }

        this.teacherService.updateTeacher(teacher);

        return new ModelAndView("redirect:/");
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteTeacherForm(HttpServletRequest request, Model model) {
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        Teacher teacher = this.teacherService.getTeacherById(teacherId);

        model.addAttribute("user", teacher.getUser());

        return "teacher/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteTeacher(@ModelAttribute("user") User user, BindingResult resultUser) {
        if(resultUser.hasErrors()) {
            return "teacher/delete";
        }

        this.userService.deleteTeacherUser(user);

        return "redirect:/";
    }


    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showTeacher(HttpServletRequest request, Model model) {
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        Teacher teacher = this.teacherService.getTeacherById(teacherId);

        model.addAttribute("teacher", teacher);

        return "teacher/show";
    }


    @RequestMapping(value = "/update-user-data", method = RequestMethod.GET)
    public String showUpdateUserForm(HttpServletRequest request, Model model) {
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        Teacher teacher = this.teacherService.getTeacherById(teacherId);

        model.addAttribute("user", teacher.getUser());

        return "teacher/update-user-data";
    }

    @RequestMapping(value = "/update-user-data", method = RequestMethod.POST)
    public ModelAndView updateUser(@Valid @ModelAttribute("user") User user, BindingResult resultUser) {
        if(resultUser.hasErrors()) {
            ModelMap model = new ModelMap();
            model.addAttribute("user", user);
            return new ModelAndView("teacher/update-user-data", model);
        }

        this.userService.updateUser(user);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listAllTeachers(HttpServletRequest request, Model model) {

        List teachers = this.teacherService.getAllTeachers();

        model.addAttribute("teachers", teachers);

        return "teacher/list";
    }
}
