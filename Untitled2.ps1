$paramsfile = @("C:\Program Files (x86)\SQLIO\param.txt", `
"C:\Program Files (x86)\SQLIO\param1.txt" , "C:\Program Files (x86)\SQLIO\param2.txt")

$params = @("-kWR -s360 -frandom -o8 -b8 -LS", `
 "-kW -s360 -frandom -o8 -b256 -LS", `
 "-kWR -s360 -fsequential -o8 -b8 -LS", `
 "-kW -s360 -fsequential -o8 -b64 -LS" )

 $file = Get-Random($paramsfile)
 Set-Location "C:\Program Files (x86)\SQLIO"
 $sec =Get-Random (15)
 switch(Get-Random($params))
  {

    "-kWR -s360 -frandom -o8 -b8 -LS"
    {$result = .\sqlio.exe -kWR "-s$sec" -frandom -o8 -b8     -LS "-F$file"}
    "-kW -s360 -frandom -o8 -b256 -LS"
    {$result = .\sqlio.exe -kW   "-s$sec" -frandom -o8 -b256    -LS "-F$file"}
    "-kWR -s360 -fsequential -o8 -b8 -LS"
    {$result = .\sqlio.exe -kWR   "-s$sec" -fsequential -o8 -b8 -LS "-F$file"}
    "-kW -s360 -fsequential -o8 -b64 -LS"
    {$result = .\sqlio.exe -kW    "-s$sec" -fsequential -o8 -b64 -LS "-F$file"}

 }
$r = $result.split('\n')
$new =(($r[$r.length-1].replace("  "," ")).substring(3,50)).replace(" ",",")

"`n" | out-file "c:\stresstest\histo.txt" -append; $new | out-file "c:\stresstest\histo.txt" -append