package com.utm.controllers;

import com.utm.editors.DateEditor;
import com.utm.editors.SubjectEditor;
import com.utm.editors.TeacherEditor;
import com.utm.entities.Lesson;
import com.utm.entities.Student;
import com.utm.entities.Subject;
import com.utm.entities.Teacher;
import com.utm.services.LessonService;
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
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/lesson")
public class LessonController {
    private LessonService lessonService;
    private SubjectService subjectService;
    private TeacherService teacherService;

    private SubjectEditor subjectEditor;
    private TeacherEditor teacherEditor;
    private DateEditor dateEditor;

    @Autowired
    public void setDateEditor(DateEditor dateEditor) {
        this.dateEditor = dateEditor;
    }

    @Autowired
    public void setTeacherEditor(TeacherEditor teacherEditor) {
        this.teacherEditor = teacherEditor;
    }

    @Autowired
    public void setSubjectEditor(SubjectEditor subjectEditor) {
        this.subjectEditor = subjectEditor;
    }

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Autowired
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @Autowired
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Subject.class, this.subjectEditor);
        binder.registerCustomEditor(Teacher.class, this.teacherEditor);
        binder.registerCustomEditor(Date.class, this.dateEditor);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateLessonForm(Model model) {
        model.addAttribute("lesson", new Lesson());
        model.addAttribute("subjects", this.subjectService.getAllSubjects());
        model.addAttribute("teachers", this.teacherService.getAllTeachers());
        return "lesson/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createLesson(@Valid @ModelAttribute("lesson") Lesson lesson, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            ModelMap model = new ModelMap();
            model.addAttribute("lesson", new Lesson());
            model.addAttribute("subjects", this.subjectService.getAllSubjects());
            model.addAttribute("teachers", this.teacherService.getAllTeachers());
            return new ModelAndView("lesson/create", model);
        }

        this.lessonService.createLesson(lesson);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateLessonForm(HttpServletRequest request, Model model) {
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        Lesson lesson = this.lessonService.getLessonById(lessonId);

        model.addAttribute("lesson", lesson);
        model.addAttribute("subjects", this.subjectService.getAllSubjects());
        model.addAttribute("teachers", this.teacherService.getAllTeachers());

        return "lesson/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView updateLesson(@Valid @ModelAttribute("lesson") Lesson lesson, BindingResult resultSubject) {
        if(resultSubject.hasErrors()) {
            ModelMap model = new ModelMap();
            model.addAttribute("lesson", lesson);
            model.addAttribute("subjects", this.subjectService.getAllSubjects());
            model.addAttribute("teachers", this.teacherService.getAllTeachers());
            return new ModelAndView("lesson/update", model);
        }

        this.lessonService.updateLesson(lesson);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteLessonForm(HttpServletRequest request, Model model) {
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        Lesson lesson = this.lessonService.getLessonById(lessonId);

        model.addAttribute("lesson", lesson);

        return "lesson/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteLesson(@ModelAttribute("lesson") Lesson lesson, BindingResult resultSubject) {
        if(resultSubject.hasErrors()) {
            return "lesson/delete";
        }

        this.lessonService.deleteLesson(lesson);

        return "redirect:/";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showLesson(HttpServletRequest request, Model model) {
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        Lesson lesson = this.lessonService.getLessonById(lessonId);

        model.addAttribute("lesson", lesson);

        return "lesson/show";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listLessons(HttpServletRequest request, Model model) {

        List lessons = this.lessonService.getAllLessons();

        model.addAttribute("lessons", lessons);

        return "lesson/list";
    }
}
