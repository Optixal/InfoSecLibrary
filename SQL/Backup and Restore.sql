--
-- BACKUP
--

-- FULL BACKUP

backup database SingPoly
to SPBackupDevice
with name = 'SingPoly Full Backup', init

-- DIFFERENTIAL BACKUP

backup database SingPoly
to SPBackupDevice
with differential, name = 'Differential Backup of SingPoly', noinit

-- TRANSACTION LOG BACKUP

backup log SingPoly
to SPBackupDevice
with name = 'Transaction Log Backup of SingPoly', noinit

-- FILEGROUP BACKUP

backup database SingPoly
filegroup = 'SP_FileGrp'
to SPBackupDevice
with name = 'File Group Backup of SingPoly', noinit

--
-- RESTORATION
--

-- COLLECT LOG BEFORE DATABASE IS DOWN
Backup Log SingPoly
To SPBackupDevice
With   Norecovery, No_Truncate

-- FULL RESTORE
Restore Database SingPoly
From SPBackupDevice
With File= 1, Partial, Norecovery

-- DIFFERENTIAL RESTORE
Restore Database SingPoly
From SPBackupDevice
With File= 2, Partial, Norecovery

-- FILEGROUP RESTORE
Restore Database SingPoly
Filegroup = 'SP_filegrp'
From SPBackupDevice
With File = 4, Norecovery

-- LOG RESTORE
Restore Log SingPoly
From SPBackupDevice
With File= 3, Recovery

-- TAIL LOG RESTORE
Restore Log SingPoly
From SPBackupDevice
With File= 5, Recovery
