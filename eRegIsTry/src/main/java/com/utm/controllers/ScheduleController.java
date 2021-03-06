package com.utm.controllers;

import com.utm.editors.GroupEditor;
import com.utm.editors.SubjectEditor;
import com.utm.editors.TeacherEditor;
import com.utm.editors.TimeEditor;
import com.utm.entities.Group;
import com.utm.entities.Schedule;
import com.utm.entities.Subject;
import com.utm.entities.Teacher;
import com.utm.services.GroupService;
import com.utm.services.ScheduleService;
import com.utm.services.SubjectService;
import com.utm.services.TeacherService;
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
import java.sql.Time;
import java.util.List;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    private SubjectService subjectService;
    private GroupService groupService;
    private ScheduleService scheduleService;
    private TeacherService teacherService;

    private SubjectEditor subjectEditor;
    private GroupEditor groupEditor;
    private TimeEditor timeEditor;
    private TeacherEditor teacherEditor;

    @Autowired
    public void setTeacherEditor(TeacherEditor teacherEditor) { this.teacherEditor = teacherEditor; }

    @Autowired
    public void setTimeEditor(TimeEditor timeEditor) {
        this.timeEditor = timeEditor;
    }

    @Autowired
    public void setGroupEditor(GroupEditor groupEditor) {
        this.groupEditor = groupEditor;
    }

    @Autowired
    public void setSubjectEditor(SubjectEditor subjectEditor) {
        this.subjectEditor = subjectEditor;
    }

    @Autowired
    public void setScheduleService(ScheduleService scheduleService) {
        this.scheduleService = scheduleService;
    }

    @Autowired
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @Autowired
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @Autowired
    public void setTeacherService(TeacherService teacherService) { this.teacherService = teacherService; }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Subject.class, this.subjectEditor);
        binder.registerCustomEditor(Group.class, this.groupEditor);
        binder.registerCustomEditor(Time.class, this.timeEditor);
        binder.registerCustomEditor(Teacher.class, this.teacherEditor);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateScheduleForm(Model model) {
        Schedule schedule = new Schedule();

        model.addAttribute("schedule", schedule);
        model.addAttribute("subjects", this.subjectService.getAllSubjects());
        model.addAttribute("groups", this.groupService.getAllGroups());
        model.addAttribute("teachers", this.teacherService.getAllTeachers());

        return "schedule/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createSchedule(@Valid @ModelAttribute("schedule") Schedule schedule, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            ModelMap model = new ModelMap();
            model.addAttribute("schedule", schedule);
            model.addAttribute("subjects", this.subjectService.getAllSubjects());
            model.addAttribute("teachers", this.teacherService.getAllTeachers());
            model.addAttribute("groups", this.groupService.getAllGroups());
            return new ModelAndView("schedule/create", model);
        }

        this.scheduleService.createSchedule(schedule);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateScheduleForm(HttpServletRequest request, Model model) {
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        Schedule schedule = this.scheduleService.getScheduleById(scheduleId);

        model.addAttribute("subjects", this.subjectService.getAllSubjects());
        model.addAttribute("groups", this.groupService.getAllGroups());
        model.addAttribute("teachers", this.teacherService.getAllTeachers());
        model.addAttribute("schedule", schedule);

        return "schedule/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView updateSchedule(@Valid @ModelAttribute("schedule") Schedule schedule, BindingResult resultSchedule) {
        if(resultSchedule.hasErrors()) {
            ModelMap model = new ModelMap();
            model.addAttribute("subjects", this.subjectService.getAllSubjects());
            model.addAttribute("groups", this.groupService.getAllGroups());
            model.addAttribute("teachers", this.teacherService.getAllTeachers());
            model.addAttribute("schedule", schedule);
            return new ModelAndView("schedule/update", model);
        }

        this.scheduleService.updateSchedule(schedule);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteScheduleForm(HttpServletRequest request, Model model) {
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        Schedule schedule = this.scheduleService.getScheduleById(scheduleId);

        model.addAttribute("schedule", schedule);

        return "schedule/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteSchedule(@ModelAttribute("schedule") Schedule schedule, BindingResult resultSchedule) {
        if(resultSchedule.hasErrors()) {
            return "schedule/delete";
        }

        this.scheduleService.deleteSchedule(schedule);

        return "redirect:/";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showSchedule(HttpServletRequest request, Model model) {
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        Schedule schedule = this.scheduleService.getScheduleById(scheduleId);

        model.addAttribute("schedule", schedule);

        return "schedule/show";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listScheduleRecords(HttpServletRequest request, Model model) {

        List scheduleRecords = this.scheduleService.getAllScheduleRecords();

        model.addAttribute("scheduleRecords", scheduleRecords);

        List groupRecords = this.groupService.getAllGroups();
        System.out.println(groupRecords);

        model.addAttribute("groupRecords", groupRecords);


        return "schedule/list";
    }
}
