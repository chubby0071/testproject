
Scenario Outline: Expected elements are displayed
  Given I am signed in
  And I have a communicating faceplate thermostats
  When I view the thermostat details
  Then the "SYSTEM STATUS" panel container is displayed  
  And it contains a "Settings" column
  And it contains a "FIRMWARE", "FAN MODE", "HTG RH SETPOINT" and "CLG RH SETPOINT" rows
  And it contains a "Status" column
  And it contains a "SYS MODE", "SYS STATUS" and "AIR FLOW" rows
  And it contains a "Operations" column
  And it contains a "SYS LV", "OUTDOOR TEMP" and "INDOOR RH" rows
  And it contains a "Accessories" column
  And it contains a "HUMIDIFIER", "DEHUMIDIFIER" and "VENTILATION" rows
  And it contains a "Zone Status" column
  And it contains a the indoor tempature, relative humidity, heating set point and cooling setpoint 


Scenario: View current "System Status" settings


Scenario: View current "System Status" status


Scenario: View current "System Status" operations


Scenario: View current "System Status" accessories


Scenario: View current "System Status" zone status

