package com.booking.bookbed.services;

import com.booking.bookbed.entities.Panel;
import com.booking.bookbed.repositories.PanelRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("panelService")
public class PanelService implements IPanelService {
    @Autowired
    private PanelRepository panelRepository;
    @Override
    public Panel save(Panel panel) {
        
        return panelRepository.save(panel);
    }

    @Override
    public Panel findById(int id) {
        
        return panelRepository.findById(id).get();
    }

}
