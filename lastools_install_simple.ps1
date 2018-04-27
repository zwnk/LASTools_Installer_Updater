# Lastools install script
# Version 1.01
# DF
# 27.04.2018

#################
# var definiton
#################

# folders for batchscripts on odin
$lastoolslicense = "\\path\2\yourlicensefile.xxx"

# LAStools download url and local install poth
$lastoolsURL = "http://lastools.org/download/LAStools.zip"
$lastoolsPathLocal = "c:\"

# for PATH Variable change drive letter and path if needed
$lastoolsfolder ="C:\LASTools"
# reg key for getting acutal path vars
$Reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
# lastools path as regex
$regex = "[cC]\:\\LASTools"


#######################################
#
# MAIN PROGRAMM DO NOT EDIT !
#
#######################################

Write-host "`nLAStools installer & updater"
Write-host "version 1.01"
Write-host "27.04.2018"

# function for checking if LAStools is running
function checkLAStoolsRunning {

    # all lastools binaries
    $progn = "blast2dem","blast2iso","las2dem","las2iso","las2las","las2shp","las2tin","las2txt","lasboundary","lascanopy","lasclassify","lasclip","lascolor","lascontrol","lascopy","lasdiff","lasduplicate","lasgrid","lasground","lasground_new","lasheight","lasindex","lasinfo","laslayers","lasmerge","lasnoise","lasoptimize","lasoverage","lasoverlap","lasplanes","lasprecision","laspublish","lasreturn","lassort","lassplit","lasthin","lastile","lastool","lastrack","lasvalidate","lasview","lasvoxel","laszip","shp2las","sonarnoiseblaster","txt2las"
    ForEach ($p in $progn) {
        $isRunning = (Get-Process | Where-Object { $_.Name -eq $p }).Count -gt 0
        if ($isRunning){
            return $true
        } 
    }
}

# LAStools is running?
if ( !(checkLAStoolsRunning) )
{

    # Download latest Version
    # get MyDocuments path
    $downloads = [System.Environment]::GetFolderPath('MyDocuments')
    Write-host "`nDownloading LASTools to $downloads ..."
    wget $lastoolsURL -OutFile "$downloads\Lastools.zip"
    
    # Extract to c\:LASTools
    Write-host "`nExtracting LASTools to C:\LASTools\"
    Expand-Archive "$downloads\Lastools.zip" -DestinationPath $lastoolsPathLocal -Force
    
    # copy license file to LAStools\bin
    copy-item $lastoolslicense $lastoolsPathLocal"\LASTools\bin"
    
    # function for creating desktop link
    function createLinkonDesktop
    {       
            param([string]$lastoolsbatchfolder, [string]$batchfilelinkname)
            Write-host "$lastoolsbatchfolder $batchfilelinkname"
            $wshshell = New-Object -ComObject WScript.Shell
            $desktop = [System.Environment]::GetFolderPath('Desktop')
            Write-host "$desktop\$batchfilelinkname.lnk" 
            $lnk = $wshshell.CreateShortcut($desktop+"\"+$batchfilelinkname+".lnk")
            $lnk.TargetPath = "$lastoolsbatchfolder"
            $lnk.Save() 
    }
    
    # creating desktop links
    Write-host "`nGenerating link to LASTools on Desktop"
    createLinkonDesktop $lastoolsfolder"\bin" "LAStools"
    
    # add path var for lastools
    # get existing path vars
    $OldPath = (Get-ItemProperty -Path "$Reg" -Name PATH).Path
    
    # checking for exisiting entry
    # if not write it
    if ( -Not ($OldPath -match $regex))
        {
        Write-host "`nSetting Path Variable to $AddedLocation"
        $NewPath= $OldPath + ';' + $AddedLocation
        Set-ItemProperty -Path "$Reg" -Name PATH -Value $NewPath
        }
    
    # if already exist skip the step
    if ($OldPath -match $regex)
        {
            Write-host "`nPATH Variable already set!"
        }
    
    Write-host "`nScript finished!`n"

} else {
    Write-host "`nAbort Mission!!!!1111"
    Write-host "`n $p is running"
}