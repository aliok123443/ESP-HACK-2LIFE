#ifndef ESPHACK_MISC_H
#define ESPHACK_MISC_H

static const int ESPHACK_EEPROM_SIZE = 128;
static const int ESPHACK_SD_MODE_EEPROM_ADDRESS = 16;
static const int ESPHACK_APPEARANCE_EEPROM_ADDRESS = 32;
static const int ESPHACK_BOOT_LOGO_EEPROM_ADDRESS = 48;
static const size_t ESPHACK_BOOT_LOGO_PATH_SIZE = 72;

extern char wifiPortalName[33];
extern char bleDeviceName[33];
extern byte sdCardMode;
void saveSDMode(byte mode);
void loadSDMode();
bool tryInitSDCard();

#endif
