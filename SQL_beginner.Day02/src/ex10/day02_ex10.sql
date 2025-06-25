SELECT people_list1.name AS person_name1, 
       people_list2.name AS person_name2,
       people_list1.address AS common_address
FROM person AS people_list1
CROSS JOIN person AS people_list2
WHERE people_list1.id>people_list2.id AND people_list1.address=people_list2.address 
ORDER BY person_name1, person_name2, common_address
