/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.display;

import android.content.Context;
import android.os.Bundle;
import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreferenceCompat;
import android.provider.Settings;

import org.lineageos.settings.R;
import org.lineageos.settings.display.DisplayNodes;
import org.lineageos.settings.utils.FileUtils;

public class DisplaySettingsFragment extends PreferenceFragment implements
        OnPreferenceChangeListener {

    private SwitchPreferenceCompat mDcDimmingPreference;
    private String DC_DIMMING_ENABLE_KEY;
    private String DC_DIMMING_NODE;
    private SwitchPreferenceCompat mHBMPreference;
    private String HBM_ENABLE_KEY;
    private String HBM_NODE;
    private String BACKLIGHT_NODE;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        DC_DIMMING_ENABLE_KEY = DisplayNodes.getDcDimmingEnableKey();
        DC_DIMMING_NODE = DisplayNodes.getDcDimmingNode();
        HBM_ENABLE_KEY = DisplayNodes.getHbmEnableKey();
        HBM_NODE = DisplayNodes.getHbmNode();
        BACKLIGHT_NODE = DisplayNodes.getBacklight();

        addPreferencesFromResource(R.xml.display_settings);
        mDcDimmingPreference = (SwitchPreferenceCompat) findPreference(DC_DIMMING_ENABLE_KEY);
        if (FileUtils.fileExists(DC_DIMMING_NODE)) {
            mDcDimmingPreference.setEnabled(true);
            mDcDimmingPreference.setOnPreferenceChangeListener(this);
        } else {
            mDcDimmingPreference.setSummary(R.string.dc_dimming_enable_summary_not_supported);
            mDcDimmingPreference.setEnabled(false);
        }
        mHBMPreference = (SwitchPreferenceCompat) findPreference(HBM_ENABLE_KEY);
        if (FileUtils.fileExists(HBM_NODE)) {
            mHBMPreference.setEnabled(true);
            mHBMPreference.setOnPreferenceChangeListener(this);
        } else {
            mHBMPreference.setSummary(R.string.hbm_enable_summary_not_supported);
            mHBMPreference.setEnabled(false);
        }
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (DC_DIMMING_ENABLE_KEY.equals(preference.getKey())) {
            FileUtils.writeLine(DC_DIMMING_NODE, (Boolean) newValue ? "1":"0");
        }
        if (HBM_ENABLE_KEY.equals(preference.getKey())) {
            boolean enabled = (Boolean) newValue;
            FileUtils.writeLine(HBM_NODE, (Boolean) newValue ? "1" : "0");

            if (enabled) {
                // Set the backlight to its maximum value
                FileUtils.writeLine(BACKLIGHT_NODE, "2047");
                // Update the system's screen brightness to maximum
                Settings.System.putInt(getContext().getContentResolver(), Settings.System.SCREEN_BRIGHTNESS, 255);
            }
        }
        return true;
    }
}
