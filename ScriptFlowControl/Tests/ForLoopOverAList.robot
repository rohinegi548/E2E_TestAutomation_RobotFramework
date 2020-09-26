*** Variables ***
${temp}  0

*** Test Cases ***
Looping through a general list
    FOR  ${item}  IN  item1  item2  item3  item4
        Log  I am logging ${item} from general list
    END

Looping through a list variable
    @{mylist}  create list  item1  item2  item3  item4  item5
    FOR  ${item}  IN  @{mylist}
        Log  I am logging ${item} from list variable
    END

Exiting and Continue from FOR loop
    @{mylist}  create list  item1  item2  item3  item4  item5
    FOR  ${item}  IN  @{mylist}
        Log  I am logging ${item} from list variable
        Run Keyword If  "${item}" == "item3"  exit for loop
        Log  Not yet exited
        continue for loop
    END

For-in-enumerate
    @{mylist}  create list  item1  item2  item3  item4  item5
    FOR    ${index}    ${item}    IN ENUMERATE    @{mylist}
        Log    item at index${index} is ${item}
    END