$resourcegroup = 'azuredemo'

$machinename = 'demovm'

$location = 'Central US'

$storageType = 'Premium_LRS'

$dataDiskName = 'newdisk01'

$dataDiskSize = 10



$datadiskConfig = New-AzDiskConfig -SkuName $storageType -Location $location -CreateOption Empty -DiskSizeGB $dataDiskSize



$dataDisk01 = New-AzDisk -DiskName $dataDiskName -Disk $datadiskConfig -ResourceGroupName $resourcegroup



$vm = Get-AzVM -Name $machinename -ResourceGroupName $resourcegroup



$vm = Add-AzVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk01.Id -Lun 1



Update-AzVM -VM $vm -ResourceGroupName $resourcegroup