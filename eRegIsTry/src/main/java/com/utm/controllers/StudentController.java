package com.utm.controllers;

import com.utm.editors.GroupEditor;
import com.utm.entities.Group;
import com.utm.entities.Student;
import com.utm.entities.User;
import com.utm.services.GroupService;
import com.utm.services.StudentService;
import com.utm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/student")
public class StudentController {
    private StudentService studentService;
    private GroupService groupService;
    private GroupEditor groupEditor;
    private UserService userService;

    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @Autowired
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @Autowired
    public void setGroupEditor(GroupEditor groupEditor) {
        this.groupEditor = groupEditor;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Group.class, this.groupEditor);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateStudentForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("groups", this.groupService.getAllGroups());
        return "student/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String submitStudent(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "student/create";
        }

        Student student = this.studentService.createStudent(user);
        this.studentService.saveStudent(student);

        return "redirect:/";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateStudentForm(HttpServletRequest request, Model model) {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        Student student = this.studentService.getStudentById(studentId);

        model.addAttribute("student", student);
        model.addAttribute("groups", this.groupService.getAllGroups());

        return "student/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateStudent(@Valid @ModelAttribute("student") Student student, BindingResult resultStudent) {
        if(resultStudent.hasErrors()) {
            return "student/update";
        }

        this.studentService.updateStudent(student);

        return "redirect:/";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteStudentForm(HttpServletRequest request, Model model) {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        Student student = this.studentService.getStudentById(studentId);

        model.addAttribute("user", student.getUser());

        return "student/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteStudent(@ModelAttribute("user") User user, BindingResult resultUser) {
        if(resultUser.hasErrors()) {
            return "student/delete";
        }

        this.userService.deleteStudentUser(user);

        return "redirect:/";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showStudent(HttpServletRequest request, Model model) {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        Student student = this.studentService.getStudentById(studentId);

        model.addAttribute("student", student);

        return "student/show";
    }


    @RequestMapping(value = "/update-user-data", method = RequestMethod.GET)
    public String showUpdateUserForm(HttpServletRequest request, Model model) {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        Student student = this.studentService.getStudentById(studentId);

        model.addAttribute("user", student.getUser());

        return "student/update-user-data";
    }

    @RequestMapping(value = "/update-user-data", method = RequestMethod.POST)
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult resultUser) {
        if(resultUser.hasErrors()) {
            return "student/update-user-data";
        }

        this.userService.updateUser(user);

        return "redirect:/";
    }
}
