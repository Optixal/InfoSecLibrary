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
