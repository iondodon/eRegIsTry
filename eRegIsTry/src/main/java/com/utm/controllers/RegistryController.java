package com.utm.controllers;

import com.utm.editors.LessonEditor;
import com.utm.editors.RegistryEditor;
import com.utm.editors.StudentEditor;
import com.utm.entities.Lesson;
import com.utm.entities.Registry;
import com.utm.entities.Student;
import com.utm.services.LessonService;
import com.utm.services.RegistryService;
import com.utm.services.StudentService;
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
import java.util.List;

@Controller
@RequestMapping("/registry")
public class RegistryController {
    private StudentService studentService;
    private RegistryService registryService;
    private LessonService lessonService;

    private StudentEditor studentEditor;
    private LessonEditor lessonEditor;
    private RegistryEditor registryEditor;


    @Autowired
    public void setRegistryEditor(RegistryEditor registryEditor) {
        this.registryEditor = registryEditor;
    }

    @Autowired
    public void setStudentEditor(StudentEditor studentEditor) {
        this.studentEditor = studentEditor;
    }

    @Autowired
    public void setRegistryService(RegistryService registryService) {
        this.registryService = registryService;
    }

    @Autowired
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @Autowired
    public void setLessonEditor(LessonEditor lessonEditor) {
        this.lessonEditor = lessonEditor;
    }

    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Student.class, this.studentEditor);
        binder.registerCustomEditor(Lesson.class, this.lessonEditor);
        binder.registerCustomEditor(Registry.class, this.registryEditor);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateRegistryForm(Model model) {
        Registry registry = new Registry();
        registry.setAbsent(false);
        model.addAttribute("registry", registry);
        model.addAttribute("students", this.studentService.getAllStudents());
        model.addAttribute("lessons", this.lessonService.getAllPastLessons());
        return "registry/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createRegistry(@Valid @ModelAttribute("registry") Registry registry, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            return "registry/create";
        }

        this.registryService.createRegistry(registry);

        return "redirect:/";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateRegistryForm(HttpServletRequest request, Model model) {
        int registryId = Integer.parseInt(request.getParameter("registryId"));
        Registry registry = this.registryService.getRegistryById(registryId);

        List students = this.studentService.getAllStudents();
        List lessons = this.lessonService.getAllPastLessons();

        model.addAttribute("registry", registry);
        model.addAttribute("students", students);
        model.addAttribute("lessons", lessons);

        return "registry/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateRegistry(@Valid @ModelAttribute("registry") Registry registry, BindingResult resultRegistry) {
        if(resultRegistry.hasErrors()) {
            return "registry/update";
        }

        this.registryService.updateRegistry(registry);

        return "redirect:/";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteRegistryForm(HttpServletRequest request, Model model) {
        int registryId = Integer.parseInt(request.getParameter("registryId"));
        Registry registry = this.registryService.getRegistryById(registryId);

        model.addAttribute("registry", registry);

        return "registry/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteRegistry(@ModelAttribute("registry") Registry registry, BindingResult resultRegistry) {
        if(resultRegistry.hasErrors()) {
            return "registry/delete";
        }

        this.registryService.deleteRegistry(registry);

        return "redirect:/";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showRegistry(HttpServletRequest request, Model model) {
        int registryId = Integer.parseInt(request.getParameter("registryId"));
        Registry registry = this.registryService.getRegistryById(registryId);

        model.addAttribute("registry", registry);

        return "registry/show";
    }
}
