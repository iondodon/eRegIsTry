package com.utm.editors;

import com.utm.entities.Teacher;
import com.utm.services.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class TeacherEditor extends PropertyEditorSupport {
    private TeacherService teacherService;

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Override
    public void setAsText(String id) {
        Teacher teacher = this.teacherService.getTeacherById(Integer.parseInt(id));
        this.setValue(teacher);
    }
}
