package com.PharmaCare.bin;

import java.util.ArrayList;
import com.PharmaCare.DAO.MedicineDAO;
import com.PharmaCare.util.Email;

public class ExpiryCheckTask implements Runnable {

    @Override
    public void run() {
        try {
            ArrayList<Medicine> expiring = MedicineDAO.getExpiringSoon();
            ArrayList<Medicine> expired = MedicineDAO.getExpired();

            if (expiring.isEmpty() && expired.isEmpty()) return;

            StringBuilder body = new StringBuilder();
            body.append("Dear Owner,\n\n");

            if (!expiring.isEmpty()) {
                body.append("Medicines expiring within 7 days:\n");
                for (Medicine m : expiring) {
                    body.append("- ")
                        .append(m.getMedicine_name())
                        .append(" (Expiry: ")
                        .append(m.getExpiry_date())
                        .append(")\n");
                }
            }

            if (!expired.isEmpty()) {
                body.append("\n❌ Expired Medicines:\n");
                for (Medicine m : expired) {
                    body.append("- ")
                        .append(m.getMedicine_name())
                        .append(" (Expired on: ")
                        .append(m.getExpiry_date())
                        .append(")\n");
                }
            }

            body.append("\nPlease take necessary action.\n\n– PharmaCare System");

            Email.sendExpiryAlert("rohankurne12@gmail.com",
                    " Medicine Expiry Alert – PharmaCare",
                    body.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
