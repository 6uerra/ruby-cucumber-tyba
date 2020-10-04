Feature: Housing Credit Calculator -  Calculate how much they lend you

  #In our credit simulator you can calculate how much a bank can lend you for the purchase of your apartment or house, 
  # according to your monthly income, you can also calculate the value of the monthly installment of your home loan.
      
        Background:
            Given I enter in metrocuadrado
     
        Scenario Outline: Validation of all possible combinations for credits
            Given my monthly income is "<money>"
              And I want to know Calculate how much they lend you in a period of "<years>"
             Then he made the simulation of my credit
              And I validate the result of my credit

        Examples:
                  | money     | years   |
                  | 737717    | 5 Años  |
                  | 6103020   | 10 Años |
                  | 9999999   | 15 Años |
                  | 100000000 | 20 Años |

        
        Scenario Outline: Validation of all possible faile combinations for credits
            Given my monthly income is "<money>"
              And I want to know Calculate how much they lend you in a period of "<years>"
             Then I validate that the error message is presented "<message>"

        Examples:
                  | money | years  | message                                              |
                  |       | 5 Años | Por favor ingresar campo                             |
                  | 63770 | 5 Años | Los ingresos deben ser mayores o iguales a $737,717. |
