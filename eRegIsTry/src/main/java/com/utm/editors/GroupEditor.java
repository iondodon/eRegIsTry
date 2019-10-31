package com.utm.editors;

import com.utm.entities.Group;
import com.utm.entities.Subject;
import com.utm.services.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class GroupEditor extends PropertyEditorSupport {
    private GroupService groupService;

    @Autowired
    void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @Override
    public void setAsText(String id) {
        Group group = this.groupService.getGroupById(Integer.parseInt(id));
        this.setValue(group);
    }
}
