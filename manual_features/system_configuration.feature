Feature: System Configuration functionality

  Scenario: View the "System Config" panel container
    Given I am signed in
    And I have a communicating faceplate thermostats
    When I view the thermostat details
    Then the "SYSTEM CONFIG" panel container is displayed
    And it contains a "Outdoor Unit" column
    And it contains a "OD UNIT TYPE", "OD UNIT STAGES" and "COMPRESSOR TYPE" rows
    And it contains a "Indoor Unit" column
    And it contains a "ID UNIT TYPE", "ID UNIT STAGES" and "BLOWER TYPE" rows
    And it contains a "Accessories" column
    And it contains a "FILTRATION TYPE", "HUMIDIFIER INSTALLED", "VENTILATION INSTALLED" and "DEHUMIDIFIER INSTALLED" rows
    And it contains a "Lockouts" column
    And it contains a "AUX HEAT", "COMP HEAT", "COOLING 1ST STG", "COMP HEAT 1ST STG" and "ID HEAT 1ST STG" rows
  
  
  Scenario outline: View current system configuration for an Outdoor Unit
    Given I have a faceplate thermostatus enrolled
    And the outdoor unit type is updated to <od type>
    And the outdoor stage(s) is updated to <od stage>
    And the outdoor compressor type is updated to <compressor type>
    When I view the detail page "SYSTEM CONFIG" panel container
    Then the "Outdoor Unit" rows are updated
    And the value for the "OD UNIT TYPE" is <od type value>
    And the value for the "OD UNIT STAGES" is <od stage value>
    And the value for the "COMPRESSOR TYPE" is <commpressor type value>
  
    Examples:
      | od type      | od stage     | compressor type             | od type value | od stage value | compressor type value |
      | None         | N/A          | N/A                         | NONE          | N/A            | N/A                   | * fail - shows values for stages and compressor type
      | Cooling Only | Single Stage | N/A                         | CLG ONLY      | 1              | 1 COMP, 1 STG         | * fail - shows 2 COMP
      | Cooling Only | Two Stages   | Single Compressor Two Stage | CLG ONLY      | 2              | 1 COMP, 2 STG         |
      | Cooling Only | Two Stages   | Two Compressor Two Stage    | CLG ONLY      | 2              | 2 COMP, 2 STG         |
      | Heat Pump    | Single Stage | N/A                         | HP            | 1              | N/A                   | * fail - shows 2 COMP, 2 STG - keeps last value
      | Heat Pump    | Two Stages   | Single Compressor Two Stage | HP            | 2              | 1 COMP, 2 STG         |
      | Heat Pump    | Two Stages   | Two Compressor Two Stage    | HP            | 2              | 2 COMP, 2 STG         |
  
  
  Scenario outline: View current system configuration for an Indoor Unit
    Given I have a faceplate thermostatus enrolled
    And the indoor unit type is updated to <id type>
    And the indoor stage(s) is updated to <id stage>
    And the indoor compressor type is updated to <compressor type>
    When I view the detail page "SYSTEM CONFIG" panel container
    Then the "Indoor Unit" rows are updated
    And the value for the "ID UNIT TYPE" is <id type value>
    And the value for the "ID UNIT STAGES" is <id stage value>
    And the value for the "COMPRESSOR TYPE" is <commpressor type value>
  
    Examples:
      | id type      | od stage     | compressor type | id type value | id stage value | compressor type value |
      | Gas/Oil      | Single Stage | Variable        | FOSSIL        | 1              | VS                    |
      | Gas/Oil      | Single Stage | Non-Variable    | FOSSIL        | 1              | NON-VS                |
      | Gas/Oil      | Two Stages   | Variable        | FOSSIL        | 2              | VS                    |
      | Gas/Oil      | Two Stages   | Non-Variable    | FOSSIL        | 2              | NON-VS                |
      | Electric     | Single Stage | Variable        | ELECT         | 1              | VS                    |
      | Electric     | Single Stage | Non-Variable    | ELECT         | 1              | NON-VS                |
      | Electric     | Two Stage    | Variable        | ELECT         | 2              | VS                    |
      | Electric     | Two Stage    | Non-Variable    | ELECT         | 2              | NON-VS                |
      | Electric     | Three Stage  | Variable        | ELECT         | 3              | VS                    |
      | Electric     | Three Stage  | Non-Variable    | ELECT         | 3              | NON-VS                |
      | Electric     | None         | Variable        | ELECT         | N/A            | VS                    | * fail - N/A or None is not displayed
      | Electric     | None         | Non-Variable    | ELECT         | N/A            | NON-VS                | * fail - N/A or None is not displayed
      | Hydronic     | Single Stage | Variable        | HYDRO         | 1              | VS                    |
      | Hydronic     | Single Stage | Non-Variable    | HYDRO         | 1              | NON-VS                |
  
  
  Scenario outline: View current system configuration for Accessories
    Given I have a faceplate thermostatus enrolled
    And the <accessory> is updated to <configured accessory>
    When I view the detail page "SYSTEM CONFIG" panel container
    Then the "Accessories" row for <accessory> is updated
    And the <accessory> setting is <accessory setting>
  
    Examples:
      | accessory              | configured accessory  | accessory setting | text color |
      | FILTRATION TYPE        | Air Cleaner           | EAC               | red        |
      | FILTRATION TYPE        | Media Filter          | MEDIA FILTER      | red        |
      | HUMIDIFIER INSTALLED   | None                  | NOT INSTALLED     | red        |
      | HUMIDIFIER INSTALLED   | Yes                   | INSTALLED         | green      |
      | VENTILATION INSTALLED  | None                  | NOT INSTALLED     | red        | * fail - doesn't update
      | VENTILATION INSTALLED  | Yes                   | INSTALLED         | green      | * fail - doesn't update
      | DEHUMIDIFIER INSTALLED | None                  | NOT INSTALLED     | red        | * fail - don't know how to set dehumififier on the 824
      | DEHUMIDIFIER INSTALLED | Yes                   | INSTALLED         | green      | * fail - don't know how to set dehumififier on the 824
  
  
  Scenario outline: View current system configuration for Lockouts
    Given I have a faceplate thermostatus enrolled
    And the <lockout> is updated to <tbd>
    And tbd
    When I view the detail page "SYSTEM CONFIG" panel container
    Then the "Lockouts" row for <lockout> is updated
    And the <lockout> setting us updated to <lockout setting>
  
    Examples:
      | lockout              | lockout setting |
      | AUX HEAT             | tbd             |
      | COMP HEAT            | tbd             |
      | COOLING 1ST STG      | tbd             |
      | COMP HEAT 1ST STG    | tbd             |
      | ID HEAT 1ST STG      | tbd             |

