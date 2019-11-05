package com.utm.controllers;

import com.utm.entities.Subject;
import com.utm.services.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/subject")
public class SubjectController {
    private SubjectService subjectService;

    @Autowired
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateSubjectForm(Model model) {
        model.addAttribute("subject", new Subject());
        return "subject/create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createSubject(@Valid @ModelAttribute("subject") Subject subject, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            return "subject/create";
        }

        this.subjectService.createSubject(subject);

        return "redirect:/";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String showUpdateSubjectForm(HttpServletRequest request, Model model) {
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        Subject subject = this.subjectService.getSubjectById(subjectId);

        model.addAttribute("subject", subject);

        return "subject/update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateSubject(@Valid @ModelAttribute("subject") Subject subject, BindingResult resultSubject) {
        if(resultSubject.hasErrors()) {
            return "subject/update";
        }

        this.subjectService.updateSubject(subject);

        return "redirect:/";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDeleteSubjectForm(HttpServletRequest request, Model model) {
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        Subject subject = this.subjectService.getSubjectById(subjectId);

        model.addAttribute("subject", subject);

        return "subject/delete";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteSubject(@ModelAttribute("subject") Subject subject, BindingResult resultSubject) {
        if(resultSubject.hasErrors()) {
            return "subject/delete";
        }

        this.subjectService.deleteSubject(subject);

        return "redirect:/";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showSubject(HttpServletRequest request, Model model) {
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        Subject subject = this.subjectService.getSubjectById(subjectId);

        model.addAttribute("subject", subject);

        return "subject/show";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listAllSubjects(HttpServletRequest request, Model model) {

        List subjects = this.subjectService.getAllSubjects();

        model.addAttribute("subjects", subjects);

        return "subject/list";
    }
}
