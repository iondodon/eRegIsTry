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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.Date;

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
    public String createLesson(@Valid @ModelAttribute("lesson") Lesson lesson, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            return "lesson/create";
        }

        this.lessonService.createLesson(lesson);

        return "redirect:/";
    }
}
