$loadcpu0 = get-random(70)
$loadcpu1 = Get-Random(70)
Start-Process "C:\Stresstest\PressureConsole.exe" -Args "-x 0:$($loadcpu0) 1:$($loadcpu1)" -NoNewWindow