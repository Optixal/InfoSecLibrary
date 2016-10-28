--
-- ADD BACKUP MEDIA
--

exec sp_addumpdevice [type], [name], [location]
exec sp_addumpdevice 'disk', 'SPBackupDevice', 'D:\SPBackup\SingPoly.bak'

--
-- BACKUP
--

-- FORMAT
Backup [ Database | Log ] database_name
-- For Filegroup/File Backup -- [ File | Filegroup = location ]
To [ backup_media | disk ] = location
[ With 
     [ NO_TRUNCATE]
     [ NOINIT | INIT | FORMAT ]
     [ DIFFERENTIAL ]
     [ NAME ] -- optional name of backup
]

-- FULL BACKUP

Backup Database SingPoly
To  SPBackupDevice
With init

-- DIFFERENTIAL BACKUP

backup database SingPoly
to SPBackupDevice
with differential, noinit

-- TRANSACTION LOG BACKUP

backup log SingPoly
to SPBackupDevice
with no_truncate

-- FILEGROUP BACKUP

backup database SingPoly
filegroup = 'SP_FileGrp'
to SPBackupDevice

--
-- RESTORATION
--

-- FORMAT
Restore [ Database | Log ] [ database_name ]
-- For Filegroup/File Restoration -- [ File | Filegroup = location ]
From [ backup_media | disk = location ] ]
[ With 
     [ [,] File = File_number ]
     [ [,] Recovery | NoRecovery ]
     [ [,] StopAt = date_time ]
]

-- COLLECT LOG BEFORE DATABASE IS DOWN
Backup Log SingPoly
To SPBackupDevice
With No_Truncate

-- FULL RESTORE
Restore Database SingPoly
From SPBackupDevice
With File = 1, Norecovery

-- DIFFERENTIAL RESTORE
Restore Database SingPoly
From SPBackupDevice
With File = 2, Norecovery

-- FILEGROUP RESTORE
Restore Database SingPoly
Filegroup = 'SP_filegrp'
From SPBackupDevice
With File = 4, Norecovery

-- LOG RESTORE
Restore Log SingPoly
From SPBackupDevice
With File = 3, NoRecovery

-- TAIL LOG RESTORE
Restore Log SingPoly
From SPBackupDevice
With File = 5, Recovery
