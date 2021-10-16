# Pewlett-Hackard-Analysis

## Overview of the analysis: Explain the purpose of this analysis.

Pewlett-Hackard's manager requested help as they are preparing for a shock of many older employees getting ready to retire in the same upcomming year, potentially leaving a dangerous gap of positions needing to be filled quickly. Working with Bobby - we want to evaluate (1) who are retiring next year, (2) how many positions will we need to fill, and (3) who are eligible to participate in a mentorship program to help bridge the skill gaps left behind. 


## Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
The results from (1) and (2) proved that the number retirement-ready employees was staggering, and so we needed to complete more specific ways of evaluating the information by department to really see where those gaps would be. The total information collected can be found in Data/retirement_info.csv. To further make sense of this, we joined/combined datasets so department, title, employee number could all be viewed in one file for easier consideration/analysis. Specifically joined the Employees table to the Dept_Emp table on the emp_no column so we could groupby department and focus on which departments would be impacted the most.

Ultimately we were able to provide a mentorship eligibility list and export it to Data/mentorship_eligibilty.csv here in order to help bridge the skill gap and focus the list by department using GROUPBY.

Finally these were all the tables made after selctions, joins, etc. : 

![Screen Shot 2021-10-16 at 12 24 48 PM](https://user-images.githubusercontent.com/82982952/137594937-313be7b6-ebeb-46d1-aedf-616c1716ddf5.png)

One major issue was making sure that any constraints added for unique values in a column (like naming a UNIQUE or PRIMARY KEY) needed to be indeed unique (meaning no duplicated in the same column), it's a reference point.For some tables, it wasn't possble to get a flly unique key, so we focused on the FOREIGN KEY and eliminated other constraints. When conceptualizing an ERD without data you can throw all kinds of relationships around for fun, but practically speaking you have to be intentional with choosing these constraints and considering how they work together-- that's the true purpose for planning out the ERD/


## Summary: 
#### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

After realizing we needed to focus our search to active employees going to retire soon, still the results were high (depending on how large the company is, and in our case it's not large enough for 90, 000+ to be leaving and there not be an issue).So consider which roles, how many, and what kind (e.g. how many managementroles). Consider the following:   
    
![Screen Shot 2021-10-16 at 12 55 15 PM](https://user-images.githubusercontent.com/82982952/137595838-468ff934-d1d4-4def-936e-2621b83ffb37.png)
    
#### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
The problem is that we seem to have about 90, 000 employees eligible to accept retirement under the two conditions of tenure and age, but in contrast we only have around 1, 500 are eligible for potential mentorship. So een if all eligble for mentorship acepted, there's still a large gap of unaccounted for roles. So internally, there doesn't see to be enough people to fill the gap, unless we reconsider parameters for mentorship elegibility.
