declare option output:method "xml";
declare option output:indent "yes";

<users>{
   for $u in /users/row
   let $count := count(/posts/row[@OwnerUserId=$u/@Id and @PostTypeId="1"])
   order by xs:integer($count) descending
   return  
     <useri>
       <name>{$u/@DisplayName}</name>
       <count>{$count}</count>
     </useri>
}</users>
