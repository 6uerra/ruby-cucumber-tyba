Feature: Housing Credit Calculator -  Calculate the value of the fees

  #In our credit simulator you can calculate how much a bank can lend you for the purchase of your apartment or house, 
  # according to your monthly income, you can also calculate the value of the monthly installment of your home loan.
      
        Background:
            Given I enter in metrocuadrado
              And selected the option Calculate the value of the installments
     
        Scenario Outline: Validation of all possible credit combinations according to my quotas
            Given  I want to request a credit worth "<money>"
              And I want to know Calculate how much they lend you in a period of "<years>" by quota
             Then I do the simulation of the quotas
              And I validate the result of my credit

        Examples:
                  | money     | years   |
                  | 15000000  | 5 Años  |
                  | 100000000 | 10 Años |
                  | 999999999 | 15 Años |
                  | 55333312  | 20 Años |

        Scenario Outline: Validation of all possible faile combinations for credits  by quotas
            Given  I want to request a credit worth "<money>"
              And I want to know Calculate how much they lend you in a period of "<years>" by quota
             Then I validate that the error message is presented "<message>"

        Examples:
                  | money | years  | message                                                    |
                  |       | 5 Años | Por favor ingresar campo                                   |
                  | 63770 | 5 Años | El valor del crédito debe ser mayor o igual a $15,000,000. |
       