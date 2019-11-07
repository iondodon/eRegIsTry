package com.utm.editors;

import com.utm.entities.Subject;
import com.utm.services.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class SubjectEditor extends PropertyEditorSupport {
    private SubjectService subjectService;

    @Autowired
    void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @Override
    public void setAsText(String id) {
        Subject subject = this.subjectService.getSubjectById(Integer.parseInt(id));
        this.setValue(subject);
    }
}
