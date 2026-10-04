/* Write your PL/SQL query statement below */
Select d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
 from(Select e.*,
                  Dense_rank() over (partition by departmentId order by salary desc) AS dk from employee e) e  
                JOIN Department d
ON e.departmentId = d.id
WHERE e.dk =1;