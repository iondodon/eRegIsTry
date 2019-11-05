package com.utm.controllers;

import com.utm.editors.StudentEditor;
import com.utm.editors.TeacherEditor;
import com.utm.entities.Group;
import com.utm.entities.Student;
import com.utm.entities.Teacher;
import com.utm.services.GroupService;
import com.utm.services.StudentService;
import com.utm.services.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/group")
public class GroupController {
    private TeacherService teacherService;
    private StudentService studentService;
    private GroupService groupService;
    private TeacherEditor teacherEditor;
    private StudentEditor studentEditor;

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @Autowired
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @Autowired
    public void setTeacherEditor(TeacherEditor teacherEditor) {
        this.teacherEditor = teacherEditor;
    }

    @Autowired
    public void setStudentEditor(StudentEditor studentEditor) {
        this.studentEditor = studentEditor;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Teacher.class, this.teacherEditor);
        binder.registerCustomEditor(Student.class, this.studentEditor);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateGroupForm(Model model) {
        model.addAttribute("group", new Group());
        model.addAttribute("teachers", this.teacherService.getAllTeachers());
        model.addAttribute("students", this.studentService.getAllStudents());
        return "group/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createGroup(@Valid @ModelAttribute("group") Group group, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            ModelMap modelMap = new ModelMap();
            modelMap.addAttribute("teachers", this.teacherService.getAllTeachers());
            modelMap.addAttribute("students", this.studentService.getAllStudents());
            return new ModelAndView("/group/create", modelMap);
        }

        this.groupService.createGroup(group);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateGroupForm(HttpServletRequest request, Model model) {
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        Group group = this.groupService.getGroupById(groupId);

        model.addAttribute("group", group);
        model.addAttribute("teachers", this.teacherService.getAllTeachers());

        return "group/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView updateGroup(@Valid @ModelAttribute("group") Group group, BindingResult resultGroup) {
        if(resultGroup.hasErrors()) {
            ModelMap model = new ModelMap();
            model.addAttribute("group", group);
            model.addAttribute("teachers", this.teacherService.getAllTeachers());
            return new ModelAndView("group/update", model);
        }

        this.groupService.updateGroup(group);

        return new ModelAndView("redirect:/");
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteGroupForm(HttpServletRequest request, Model model) {
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        Group group = this.groupService.getGroupById(groupId);

        model.addAttribute("group", group);

        return "group/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteGroup(@ModelAttribute("group") Group group, BindingResult resultGroup) {
        if(resultGroup.hasErrors()) {
            return "group/delete";
        }

        this.groupService.deleteGroup(group);

        return "redirect:/";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showGroup(HttpServletRequest request, Model model) {
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        Group group = this.groupService.getGroupById(groupId);

        model.addAttribute("group", group);

        return "group/show";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listGroups(HttpServletRequest request, Model model) {

        List groups = this.groupService.getAllGroups();

        model.addAttribute("groups", groups);

        return "group/list";
    }
}
