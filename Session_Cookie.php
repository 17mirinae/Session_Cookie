<h3>Cooky test</h3>
<?php

$cookie_name = "날짜";
$cookie_value =  date("Y-m-d", time());
setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/"); // 86400 = 1 day]
echo "Cookie1 '" . $cookie_name . "' is set!<br>";
echo "현재 (쿠키)날짜는: " . $_COOKIE[$cookie_name]."<br>";

/////////////////////////////////////////////////////////

//echo "before set new cooky=".$_COOKIE['sku']."<br>";
$count = $_COOKIE['count_num'];


SetCookie("sku","방문자",time()+3600);

//echo "after set new cooky=".$_COOKIE['sku']."<br>";

SetCookie("count_num",++$count,time()+3600);
echo $_COOKIE['sku']."님(쿠키)은 <b>$count</b>번째 방문객 입니다.<br><br>";
/////////////////////////////////////////////////////////
?>
<?php
  session_start();
  $_SESSION[name]="MJKim";
  $_SESSION[count]++;     
  echo "세션 사용자 ".$_SESSION[name]."의 방문 횟수는".$_SESSION[count]."입니다.<br>";
  echo "<p> 세션 id : ".session_id()."<br>";
?>

<?php
////////////////////////////////////////////
 $save=file("./counter.dat");
 $num=$save[0] + 1;
 
 exec("echo $num > ./counter.dat");
 print("파일 사용자는 $num 번째 방문객입니다. <br>\n");

?>

<!---------------------------------------------------->

<html><body>
<h3>My Cooky, Session, File Test</h3>
<?php
    $date = $_COOKIE['date'];
    $count = $_COOKIE['count'];
    
    SetCookie("date", Date("Y/m/j"), time()+3600);
    SetCookie("who", "방문자님", time()+3600);
    SetCookie("count", ++$count, time()+3600);
    
    echo "오늘의 날짜는 ".$date."입니다.<br>";
    echo $_COOKIE['who']." 님의 방문 횟수(쿠키)는 ".$count."입니다.<br>";
    
    //////////////////////////////////////////////////////////
    
    session_start();
    $_SESSION[name] = '방문자님';
    $_SESSION[count]++;
    
    echo $_SESSION[name]." 님의 방문 횟수(세션)는 ".$_SESSION[count]."입니다.";
    echo "<p>세션 아이디: ".session_id()."<br>";
    
    /////////////////////////////////////////////////////////
    
    $file = file("./count.dat");
    $count = $file[0] + 1;
    
    exec("echo $count > ./count.dat");
    
    echo "방문자님 님의 방문 횟수(파일)은 ".$count."입니다.";
?>
</body></html>