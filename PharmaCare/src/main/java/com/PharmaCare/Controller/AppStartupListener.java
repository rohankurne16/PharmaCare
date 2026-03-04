package com.PharmaCare.Controller;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.PharmaCare.bin.*;

@WebListener
public class AppStartupListener implements ServletContextListener {

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newSingleThreadScheduledExecutor();

        // Schedule to run once a day
        scheduler.scheduleAtFixedRate(new ExpiryCheckTask(),
                0, // initial delay (0 = run immediately on startup)
                12, TimeUnit.HOURS
                ); // repeat every 24 hours
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null && !scheduler.isShutdown()) {
            scheduler.shutdownNow();
        }
    }
}
