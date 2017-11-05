
function RenameTVShows
{

    $shows = Get-ChildItem "E:\My Videos\TV Shows\*.mkv" -File -Recurse

    $logFile = "E:\My Videos\TV Shows\{0}-Rename.log" -f (Get-Date -Format "yyyy-MM-dd-hh-mm-ss");

    Out-File $logFile -NoClobber;

    foreach ($episode in $shows) 
    {
        $newname = $episode.Name -replace '(\d{1})x(\d{1,2})', 'S0$1E$2'
        Add-Content $logFile -Value ("{0}     >>     {1}" -f $episode.Name, $newname)
       
        Rename-Item -LiteralPath $episode.FullName -NewName $newname -Force
    }
}